class TrailInfo::State

  attr_accessor :name, :trails
  @@all = []

  def initialize(name, state_code) #Creates new state instance and initializes scraping and new trail instances
    @name = name
    @trails = []
    TrailInfo::Scraper.new(state_code)
    TrailInfo::Scraper.create_trails(state_code).each do |trail|
      @trails << TrailInfo::Trail.new(self, trail)
    end
    @@all << self
  end

  def self.all #returns all trails for state instance
    @@all
  end

  def self.clear_all #clears trails for state instance
    @@all.clear
  end

  def self.trail_list #Writes list of states trails
    @trail_list = []
    @@all[0].trails.each.with_index(1) do |trail, i| 
      trail_description = "#{i}. #{trail.name} | Length: #{trail.length} | Surface: #{trail.surface}|"
      puts trail_description
      @trail_list << trail_description
    end
    @trail_list
  end

end


