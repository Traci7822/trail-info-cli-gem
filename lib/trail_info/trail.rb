class TrailInfo::Trail

attr_accessor :name, :length, :duration, :location, :difficulty, :state

@@all 

def save
  @@all << self
end

def self.all
  @@all
end

end