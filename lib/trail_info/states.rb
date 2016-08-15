class TrailInfo::State

  attr_accessor :name, :trails
  @@all = []

  def initialize(name, state_code)
    @name = name
    @trails = []
    TrailInfo::Scraper.new(state_code)
    TrailInfo::Scraper.create_trails(state_code).each do |trail|
      @trails << TrailInfo::Trail.new(self, trail)
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear_all
    @@all.clear
  end

  def self.trail_list
    @trail_list = []
    @@all[0].trails.each.with_index(1) do |trail, i| 
      trail_description = "#{i}. #{trail.name} | Length: #{trail.length} | Surface: #{trail.surface}|"
      puts trail_description
      @trail_list << trail_description
    end
    @trail_list
  end

end


