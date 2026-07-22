#!/usr/bin/env ruby
# tend — deterministic implementation of commands/tend.md (Track E, E2 first wave).
# Regenerates the garden.md snapshot between the tend markers and reports drift.
# Never touches anything outside the markers.
#
#   ruby commands/tend.rb --root <dir-containing-games/> [--json]
#
# Settlement (exit 0): snapshot matches the folder structure, drift reported.

require 'optparse'
require 'json'
require 'date'
require_relative '../src/garden'

class Tend
  BEGIN_MARKER = /<!-- tend:begin[^>]*-->/
  END_MARKER   = /<!-- tend:end -->/

  def initialize(root)
    @root = Garden::Root.new(root)
    @today = Date.today
  end

  def run
    before = prior_slugs
    snapshot = render_snapshot
    rewrite_between_markers(snapshot)
    drift(before)
  end

  private

  # -- scan ------------------------------------------------------------------

  def games = @games ||= @root.games

  def open_rows(game)
    game.open_capers
        .map { |c| { caper: c, date: c.last_touched } }
        .sort_by { |r| [r[:date], r[:caper].slug] }.reverse
  end

  # -- snapshot --------------------------------------------------------------

  def render_snapshot
    lines = ["### Snapshot — tended #{@today.iso8601}", '',
             'Derived from folder structure + modification dates. ⚠ = untouched 30+ days.', '']
    games.each { |game| lines.concat(game_section(game)) }
    lines.join("\n")
  end

  def game_section(game)
    open = open_rows(game)
    lines = ["#### #{game.name} — #{open.size} open · #{game.published.size} published · #{game.stale.size} stale", '',
             '| caper | stage | last touched | pending |', '|---|---|---|---|']
    open.each { |row| lines << table_row(row[:caper]) }
    lines << ''
    lines.concat(compact_lines(game))
    lines << ''
    lines
  end

  def table_row(caper)
    warn_mark = caper.drifting?(@today) ? ' ⚠' : ''
    pending = caper.pending_turn? ? 'turn.md' : ''
    "| #{caper.slug} | #{caper.stage} | #{caper.last_touched.iso8601}#{warn_mark} | #{pending} |"
  end

  def compact_lines(game)
    lines = []
    lines << "**published:** #{game.published.map(&:number).join(', ')}  " if game.published.any?
    lines << "**stale:** #{game.stale.map(&:number).join(', ')}" if game.stale.any?
    lines
  end

  def rewrite_between_markers(snapshot)
    content = File.read(@root.garden_md)
    opening = content[BEGIN_MARKER] or abort "tend: no begin marker in #{@root.garden_md}"
    content[END_MARKER] or abort "tend: no end marker in #{@root.garden_md}"
    pre, rest = content.split(BEGIN_MARKER, 2)
    _, post = rest.split(END_MARKER, 2)
    File.write(@root.garden_md, "#{pre}#{opening}\n#{snapshot}\n<!-- tend:end -->#{post}")
  end

  # -- drift -----------------------------------------------------------------

  # Slugs named anywhere in the prior snapshot (open table rows + compact number lists).
  def prior_slugs
    content = File.read(@root.garden_md)
    section = content[/#{BEGIN_MARKER}.*?#{END_MARKER}/m].to_s
    rows = section.scan(/^\|\s*([^|]+?)\s*\|/).flatten - ['caper', '---']
    compact = section.scan(/^\*\*(?:published|stale):\*\*\s*(.+)$/).flatten
                     .flat_map { |list| list.split(',').map(&:strip) }
    rows + compact
  end

  def drift(prior)
    caper_states = games.flat_map do |game|
      (game.open_capers + game.published + game.stale).map { |c| [game, c] }
    end
    known = ->(caper) { prior.include?(caper.slug) || prior.include?(caper.number) }
    {
      new_capers: caper_states.reject { |_, c| known.(c) }.map { |g, c| "#{g.name}/#{c.slug} (#{c.state})" },
      moved: caper_states.select { |_, c| c.state != :open && prior.include?(c.slug) }
                         .map { |g, c| "#{g.name}/#{c.slug} → #{c.state}" },
      pending_turns: caper_states.select { |_, c| c.state == :open && c.pending_turn? }.map { |g, c| "#{g.name}/#{c.slug}" },
      drifting: caper_states.select { |_, c| c.state == :open && c.drifting?(@today) }.map { |g, c| "#{g.name}/#{c.slug}" }
    }
  end
end

if __FILE__ == $PROGRAM_NAME
  options = { root: Dir.pwd, json: false }
  OptionParser.new do |o|
    o.on('--root DIR', 'directory containing games/') { |v| options[:root] = v }
    o.on('--json', 'machine-readable drift report') { options[:json] = true }
  end.parse!

  report = Tend.new(options[:root]).run

  if options[:json]
    puts JSON.pretty_generate({ tended: Date.today.iso8601 }.merge(report))
  else
    puts "Snapshot regenerated (tended #{Date.today.iso8601})."
    { new_capers: 'New capers (not in prior snapshot)',
      moved: 'Moved state',
      pending_turns: 'Open capers with pending turn.md',
      drifting: 'Open capers untouched 30+ days' }.each do |key, label|
      items = report[key]
      puts "\n#{label}: #{items.empty? ? 'none' : ''}"
      items.each { |i| puts "  - #{i}" }
    end
  end
end
