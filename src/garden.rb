# The garden's folder structure as a model. Source of truth per garden.md:
# capers/ = open, published/ = published, stale/ = stale.
# Consumed by the command scripts (tend, ready, publish) that sit beside
# their definitions in commands/.

require 'date'

module Garden
  STALE_AFTER_DAYS = 30

  class Caper
    STAGE_EVIDENCE = [
      ['shared',     ->(c) { c.artefact?('share.md') }],
      ['evaluated',  ->(c) { c.evaluations.any? }],
      ['drafted',    ->(c) { c.artefact?('draft.md') }],
      ['researched', ->(c) { c.artefact?('research.md') }]
    ].freeze

    attr_reader :path, :state

    def initialize(path, state)
      @path = path
      @state = state # :open | :published | :stale
    end

    def slug = File.basename(path)

    def number = slug[/\A[\d]+/] || slug

    def artefacts_dir = File.join(path, 'artefacts')

    def artefact?(name) = File.file?(File.join(artefacts_dir, name))

    def evaluations
      Dir.glob(File.join(artefacts_dir, 'evaluations', '*')).select { |f| File.file?(f) }
    end

    def evaluation(name)
      path = File.join(artefacts_dir, 'evaluations', name)
      File.file?(path) ? path : nil
    end

    def revisions
      Dir.glob(File.join(artefacts_dir, 'draft*.md'))
    end

    def stage
      return state.to_s unless state == :open
      found = STAGE_EVIDENCE.find { |_, evidence| evidence.call(self) }
      found ? found.first : 'seed'
    end

    def last_touched
      newest = Dir.glob(File.join(path, '**', '*')).select { |f| File.file?(f) }
                  .map { |f| File.mtime(f) }.max
      (newest || File.mtime(path)).to_date
    end

    def pending_turn? = File.file?(File.join(path, 'turn.md'))

    def drifting?(today = Date.today) = (today - last_touched).to_i >= STALE_AFTER_DAYS
  end

  class Game
    STATES = { open: 'capers', published: 'published', stale: 'stale' }.freeze

    attr_reader :path

    def initialize(path)
      @path = path
    end

    def name = File.basename(path)

    def open_capers = capers(:open)

    def published = capers(:published)

    def stale = capers(:stale)

    def link_map = File.join(path, 'published', 'link-map.md')

    def capers(state)
      dir = File.join(path, STATES.fetch(state))
      return [] unless File.directory?(dir)
      Dir.children(dir).sort
         .map { |c| File.join(dir, c) }
         .select { |p| File.directory?(p) }
         .map { |p| Caper.new(p, state) }
    end
  end

  class Root
    attr_reader :path

    def initialize(path)
      @path = File.expand_path(path)
      raise ArgumentError, "no games/ under #{@path}" unless File.directory?(games_dir)
    end

    def games_dir = File.join(path, 'games')

    def garden_md = File.join(games_dir, 'garden.md')

    def games
      Dir.children(games_dir).sort
         .map { |g| File.join(games_dir, g) }
         .select { |p| File.directory?(File.join(p, 'capers')) }
         .map { |p| Game.new(p) }
    end

    def find_open_caper(query)
      games.each do |game|
        caper = game.open_capers.find { |c| c.number == query || c.slug == query || c.slug.include?(query) }
        return [game, caper] if caper
      end
      nil
    end
  end
end
