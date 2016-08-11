class TrailInfo::Trails

  attr_accessor :name, :difficulty, :length, :duration, :location

  @@all = []
  @state_names = ["California", "New York", "Texas", "Washington"]
    #need to populate @state_names with scraping
  @state_trails = ["trail1", "trail2", "trail3"]

  def initialize

  end

  def self.create_trails #creates hashes of trails and adds them to @trails array
    @state_trails.each do |trail|
      #populate trails_array with scraping
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

  def self.create_state_trails #creates array of state names and their trail arrays
    @states = Hash[@state_names.map {|state| [state, @trails]}]
  end

  def self.all
    @@all
  end

end
