class TrailInfo::State

  attr_accessor :name
  @@all = []

  def initialize(name, state_code)
    @name = name
    @trails = []
    TrailInfo::Scraper.new(state_code)
    TrailInfo::Scraper.create_trails(state_code).each do |trail|
      @trails << TrailInfo::Trail.new(self, trail)
    end

    trail_list    
    @@all << self
  end

  def self.all
    @@all
  end

  def trail_list
    @trails.each.with_index(1) do |trail, i| 
      puts "#{i}. #{trail.name} | Length: #{trail.length} | Surface: #{trail.surface}|"
    end
  end

end
