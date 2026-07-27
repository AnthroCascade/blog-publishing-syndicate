#!/usr/bin/env ruby
# publish — deterministic implementation of commands/publish.md.
# Records a publication that already happened: folder move, link-map append, tend refresh.
# The pasting into Substack stays manual; the in-voice link-map description lines stay NL —
# they arrive via --entry-file, drafted in the main loop and approved by the author.
#
#   ruby commands/publish.rb <caper> --root <dir> --url <live-url> --date <YYYY-MM-DD> \
#        --entry-file <approved-link-map-section>
#
# Without --entry-file the command stops before touching anything, prints the section
# skeleton for the NL pass to complete, and exits 2 (awaiting approved entry).
#
# Settlement (exit 0): caper in published/, entry appended (status rendered),
# garden snapshot current.

require 'optparse'
require 'fileutils'
require 'date'
require_relative '../src/garden'
require_relative 'tend'

class Publish
  def initialize(root, query, url:, date:, entry_file: nil, despite_turn: false)
    @root_path = root
    @game, @caper = Garden::Root.new(root).find_open_caper(query) ||
                    abort("publish: no open caper matches '#{query}'")
    @url = url
    @date = date
    @entry_file = entry_file
    @despite_turn = despite_turn
  end

  def run
    confirm!
    return await_entry unless @entry_file
    move
    append_entry
    Tend.new(@root_path).run
    report
  end

  private

  def confirm!
    abort 'publish: no URL, no publish — supply --url' if @url.to_s.empty?
    abort 'publish: publication date required — supply --date YYYY-MM-DD' unless valid_date?
    return unless @caper.pending_turn? && !@despite_turn
    abort "publish: #{@caper.slug} has a pending turn.md — published capers don't owe turns. " \
          'Resolve it, or pass --despite-turn to move anyway.'
  end

  def valid_date?
    Date.iso8601(@date.to_s)
  rescue Date::Error
    false
  end

  def await_entry
    warn "publish: link-map entry not supplied — nothing moved. Draft the section below\n" \
         "(link-map.md rule 6: author's voice, author's coinages), get author approval,\n" \
         'then re-run with --entry-file <path>.'
    puts skeleton
    exit 2
  end

  def skeleton
    slug = @caper.slug.sub(/\A\d+-/, '')
    <<~ENTRY
      ### #{slug} — <title>
      date: #{@date} · url: #{@url}
      status: rendered
      coins: <the post's coinages>
      prior-pieces:
        - <earlier-slug> — <in-voice description> — <earlier-url>
      section-markdown: |
        ---
        **Prior pieces**
        - [<earlier title>](<earlier-url>) — <in-voice description>
    ENTRY
  end

  def published_path = File.join(@game.path, 'published', @caper.slug)

  def move
    FileUtils.mv(@caper.path, published_path)
  end

  def append_entry
    entry = File.read(@entry_file).strip
    File.open(@game.link_map, 'a') { |f| f.write("\n#{entry}\n") }
  end

  def report
    puts "#{@caper.slug} → published/ · link-map entry appended (status rendered) · garden snapshot refreshed."
    puts 'Author pastes the section-markdown into Substack and flips the row to live.'
    puts 'Next move: /share writes the platform-native announcement texts.'
  end
end

if __FILE__ == $PROGRAM_NAME
  options = { root: Dir.pwd }
  OptionParser.new do |o|
    o.on('--root DIR', 'directory containing games/') { |v| options[:root] = v }
    o.on('--url URL', 'live URL (from the author — never assumed)') { |v| options[:url] = v }
    o.on('--date DATE', 'publication date, YYYY-MM-DD') { |v| options[:date] = v }
    o.on('--entry-file PATH', 'approved link-map section to append') { |v| options[:entry_file] = v }
    o.on('--despite-turn', 'move even with a pending turn.md') { options[:despite_turn] = true }
  end.parse!

  query = ARGV.first || abort('publish: which caper? (number or slug)')
  Publish.new(options[:root], query,
              url: options[:url], date: options[:date],
              entry_file: options[:entry_file], despite_turn: options[:despite_turn]).run
end
