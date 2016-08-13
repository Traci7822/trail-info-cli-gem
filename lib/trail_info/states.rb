class TrailInfo::State

  attr_accessor :name
  @@all = []
  @trails_array = []
  def initialize(name, state_code)
    @name = name
    TrailInfo::Scraper.new(state_code)
    @trails_array = TrailInfo::Trail.all
    @trails = @trails_array.collect do |trail_attributes|
      TrailInfo::Trail.new(self, trail_attributes)
    end
    trail_list

    
    @@all << self

    trail_list
  end
 

  def self.state_selection(states_array)
    @state_number = gets.strip.to_i
    state = states_array[@state_number]
    TrailInfo::UserInteraction.list_trails(@state_number, state)    
  end

  def self.all
    @@all
  end

  def self.trail_list
    @trails.each.with_index(1) do |trail, i| 
      puts "#{i}. #{trail.name} | Length: #{trail.length} | Surface: #{trail.surface}|"
    end
  end

end
