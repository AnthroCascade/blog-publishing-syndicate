#!/usr/bin/env ruby
# ready — deterministic implementation of commands/ready.md (Track E, E2 first wave).
# Read-only: assesses publication readiness from artefact evidence. Writes nothing.
#
#   ruby commands/ready.rb --root <dir-containing-games/> [caper] [--json]
#
# The one NL residue stays NL: judging whether turn.md's factual corrections were
# applied to the draft needs language understanding — the script reports turn.md's
# presence and leaves the verification item on the remaining-work list.
#
# Settlement (exit 0): every requested caper assessed, remaining work listed,
# sort order visible.

require 'optparse'
require 'json'
require_relative '../src/garden'

# The three-tier verdict-extraction protocol, verbatim from ready.md:
# frontmatter verdict: key → first gestalt/verdict heading's next line →
# first PASS/FAIL/... line. Never infer.
class VerdictExtraction
  FALLBACK = /(?i)(PASS|FAIL|NEEDS\s*WORK|WARNING|CORROBORATED|VERIFIED)/
  NONE = 'NO VERDICT FOUND'

  def self.from(file)
    lines = File.read(file).lines.map(&:chomp)
    frontmatter(lines) || after_heading(lines) || fallback(lines) || NONE
  end

  def self.frontmatter(lines)
    return nil unless lines.first == '---'
    body = lines[1..(lines[1..].index('---') || 0)]
    body.find { |l| l =~ /\Averdict:\s*(.+)/ } && Regexp.last_match(1).strip
  end

  def self.after_heading(lines)
    index = lines.index { |l| l =~ /\A#+.*(?i:gestalt|verdict)/ }
    return nil unless index
    lines[(index + 1)..].find { |l| !l.strip.empty? }&.strip
  end

  def self.fallback(lines)
    lines.find { |l| l =~ FALLBACK }&.strip
  end
end

class Ready
  # Pipeline phases → the artefact evidence that settles them, per ready.md.
  PHASES = [
    { phase: 'Research',   artefact: 'research.md',               kind: :artefact,   command: '/research' },
    { phase: 'Draft',      artefact: 'draft.md',                  kind: :artefact,   command: '/draft' },
    { phase: 'Corpus',     artefact: 'prior-articles.md',         kind: :artefact,   command: nil },
    { phase: 'Structure',  artefact: 'forte-structural-thinker.md', kind: :evaluation, command: '/structure' },
    { phase: 'Structure',  artefact: 'forte-thesis-sharpener.md',  kind: :evaluation, command: '/structure' },
    { phase: 'Structure',  artefact: 'forte-continuity-thinker.md', kind: :evaluation, command: '/structure' },
    { phase: 'Polish',     artefact: 'forte-voice-guardian.md',    kind: :evaluation, command: '/polish' },
    { phase: 'Polish',     artefact: 'forte-cognition-sensor.md',  kind: :evaluation, command: '/polish' },
    { phase: 'Reception',  artefact: 'forte-reader-proxy.md',      kind: :evaluation, command: '/reception' },
    { phase: 'Verify',     artefact: 'forte-fact-checker-verify.md', kind: :evaluation, command: '/verify' },
    { phase: 'Governance', artefact: 'forte-protector.md',         kind: :evaluation, command: '/protect' },
    { phase: 'Governance', artefact: 'forte-interrogator.md',      kind: :evaluation, command: nil }
  ].freeze

  MARKERS = ['<WARNING>', '[NEEDS:]', '[TODO]', 'placeholder', '<!-- AUTHOR:'].freeze
  MARKER_PATTERNS = {
    '<WARNING>' => /<WARNING>/,
    '[NEEDS:]' => /\[NEEDS:/,
    '[TODO]' => /\[TODO\]/,
    'placeholder' => /\[[A-Z]{3,}:/, # [LACHLAN:] and similar contributor placeholders
    '<!-- AUTHOR:' => /<!--\s*AUTHOR:/
  }.freeze

  FAILING = /(?i)\b(FAIL|NEEDS\s*WORK)\b/

  def initialize(root)
    @root = Garden::Root.new(root)
  end

  def assess_all
    @root.games.flat_map { |g| g.open_capers }.map { |c| assess(c) }
         .sort_by { |a| [a[:remaining].size, a[:remaining].count { |r| r[:weight] == :heavy }] }
  end

  def assess_one(query)
    _, caper = @root.find_open_caper(query) || abort("ready: no open caper matches '#{query}'")
    assess(caper)
  end

  private

  def assess(caper)
    rows = checklist_rows(caper)
    { caper: caper.slug, stage: caper.stage, rows: rows,
      remaining: remaining_work(caper, rows), time_sensitive: time_sensitive?(caper) }
  end

  def checklist_rows(caper)
    PHASES.map { |p| phase_row(caper, p) } + extra_rows(caper)
  end

  def phase_row(caper, spec)
    path = spec[:kind] == :evaluation ? caper.evaluation(spec[:artefact]) : artefact_path(caper, spec[:artefact])
    { phase: spec[:phase], artefact: spec[:artefact].delete_suffix('.md'), present: !path.nil?,
      verdict: (VerdictExtraction.from(path) if path && spec[:kind] == :evaluation), command: spec[:command] }
  end

  def extra_rows(caper)
    rows = []
    if (revisions = caper.revisions).size > 1
      rows << { phase: 'Draft', artefact: 'revision files', present: true, verdict: "#{revisions.size} versions" }
    end
    if (accounting = artefact_path(caper, 'mob-accounting.md'))
      rows << { phase: 'Mob', artefact: 'mob-accounting', present: true, verdict: VerdictExtraction.from(accounting) }
    end
    rows << { phase: 'Author', artefact: 'turn.md', present: caper.pending_turn?, verdict: nil }
    if (draft = artefact_path(caper, 'draft.md'))
      counts = marker_counts(draft)
      rows << { phase: 'Quality', artefact: 'draft markers', present: true,
                verdict: counts.values.sum.zero? ? '0 warnings' : counts.reject { |_, v| v.zero? }.map { |k, v| "#{v} #{k}" }.join(', ') }
    end
    rows
  end

  def artefact_path(caper, name)
    caper.artefact?(name) ? File.join(caper.artefacts_dir, name) : nil
  end

  def marker_counts(draft)
    content = File.read(draft)
    MARKERS.to_h { |m| [m, content.scan(MARKER_PATTERNS[m]).size] }
  end

  # Each remaining item carries a weight: light (verify, correct, run a pass)
  # sorts above heavy (rewrite, structural rework) at equal counts.
  def remaining_work(caper, rows)
    items = missing_phases(rows) + failing_verdicts(rows) + marker_items(rows)
    items << { item: 'verify turn.md corrections applied to draft (language judgment — NL pass)', weight: :light } if caper.pending_turn?
    items
  end

  def missing_phases(rows)
    rows.select { |r| r[:command] && !r[:present] }
        .group_by { |r| r[:command] }
        .map { |command, _| { item: "#{command} not run", weight: :light } }
  end

  def failing_verdicts(rows)
    rows.select { |r| r[:verdict] =~ FAILING }
        .map { |r| { item: "address #{r[:artefact]} verdict: #{r[:verdict]}", weight: :heavy } }
  end

  def marker_items(rows)
    markers = rows.find { |r| r[:artefact] == 'draft markers' }
    return [] unless markers && markers[:verdict] != '0 warnings'
    [{ item: "resolve draft markers (#{markers[:verdict]})", weight: :light }]
  end

  def time_sensitive?(caper)
    spec = File.join(caper.path, 'caper.md')
    File.file?(spec) && File.read(spec) =~ /(?i)time.sensitive|news hook|deadline/ ? true : false
  end
end

# -- presentation ------------------------------------------------------------

def print_checklist(assessment)
  puts "### #{assessment[:caper]} (#{assessment[:remaining].size} remaining)#{assessment[:time_sensitive] ? ' ⏰ time-sensitive' : ''}"
  puts
  puts '| Phase | Artefact | Present | Verdict |'
  puts '|---|---|---|---|'
  assessment[:rows].each do |r|
    puts "| #{r[:phase]} | #{r[:artefact]} | #{r[:present] ? '✓' : '—'} | #{r[:verdict]} |"
  end
  puts
  if assessment[:remaining].any?
    puts 'Remaining work:'
    assessment[:remaining].each_with_index { |r, i| puts "#{i + 1}. #{r[:item]}" }
  else
    puts 'Remaining work: none evidenced — ready for author call.'
  end
  puts
end

def print_summary(assessments)
  puts '| Caper | Remaining | Items |'
  puts '|---|---|---|'
  assessments.each do |a|
    items = a[:remaining].map { |r| r[:item] }.join('; ')
    puts "| #{a[:caper]} | #{a[:remaining].size} | #{items[0, 80]} |"
  end
  puts
end

if __FILE__ == $PROGRAM_NAME
  options = { root: Dir.pwd, json: false }
  OptionParser.new do |o|
    o.on('--root DIR', 'directory containing games/') { |v| options[:root] = v }
    o.on('--json', 'machine-readable assessment') { options[:json] = true }
  end.parse!

  ready = Ready.new(options[:root])
  assessments = ARGV.first ? [ready.assess_one(ARGV.first)] : ready.assess_all

  if options[:json]
    puts JSON.pretty_generate(assessments)
  else
    print_summary(assessments) if assessments.size > 1
    assessments.each { |a| print_checklist(a) }
  end
end
