class TrailInfo::State

  attr_accessor :name
  @@all = []

  def initialize(name, state_code)
    @name = name
    @trails = []
    TrailInfo::Scraper.new(state_code)
    trail_hash = TrailInfo::Scraper.create_trails(state_code)
    trail_hash.each do |trail|
      @trails << TrailInfo::Trail.new(self, trail)
    end

    trail_list    
    @@all << self
  end
 

  def self.state_selection(states_array, state_selection)
    state = states_array.values[state_selection - 1]
    TrailInfo::UserInteraction.list_trails(state_selection, state)    
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
