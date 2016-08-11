class TrailInfo::Trails

attr_accessor :name, :difficulty, :length, :duration, :location

@@all = []

def initialize

end

def self.create_trails(trails_array)
  trails_array.each do |trail|
    trail = self.new
    trail.name = "Pine Ridge Trail to Sykes Hot Springs"
    trail.difficulty = "Difficult"
    trail.length = "20 miles"
    trail.duration = "Multiple Days"
    location = "Pfeiffer Big Sur State Park"
    @@all << trail
  end
end

def self.all
  @@all
end

end




