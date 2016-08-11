class TrailInfo::Trails

  attr_accessor :name, :difficulty, :length, :duration, :location

  @@all = []
  @@STATE_NAMES = [
  'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'District of Columbia', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois',
  'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska',
  'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 
  'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
  
  def initialize

  end

  def self.create_trails #creates hashes of trails and adds them to @trails array
    @state_trails = ["Natural Wells Trail - Montesano State Park", "Chinnabee-Skyway-Pinhoti", "Walls of Jericho Trail"]
    @state_trails.each do |trail|
      i = 0
      trail = {}
      trail = {
        "name" => "#{@state_trails[i]}", 
        "difficulty" => "Difficult",
        "length" => "20 miles",
        "duration" => "Multiple Days",
        "location" => "Pfeiffer Big Sur State Park"
        }
        i += 1
        @trails = []
        @trails << trail
    end
    @trails
    create_state_trails
  end

  def self.create_state_trails #creates array of state names and their trail arrays
    @states = Hash[@@STATE_NAMES.map {|state| [state, @trails]}]
    @states
  end

  def self.all
    @@all
  end


end
