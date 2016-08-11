class TrailInfo::Trails

  attr_accessor :name, :difficulty, :length, :duration, :location

  @@all = []
  @state_names = ["California", "New York", "Texas", "Washington"]
    #need to populate @state_names with scraping

  def initialize

  end

  def self.create_trails(trails_array)
    trails_array.each do |trail|
      trail = {}
      trail = {
        "name" => "Pine Ridge Trail to Sykes Hot Springs", 
        "difficulty" => "Difficult",
        "length" => "20 miles",
        "duration" => "Multiple Days",
        "location" => "Pfeiffer Big Sur State Park"
        }
        @trails = []
        @trails << trail
    end
    create_state_trails
  end

  def self.create_state_trails
    @states = Hash[@state_names.map {|state| [state, @trails]}]
    @states

  end

  def self.all
    @@all
  end

end
