class TrailInfo::Trail

attr_accessor :name, :length, :duration, :location, :difficulty, :state

@@all = []

def initialize
  @name = name
end

def save
  @@all << self
end

def self.all
  @@all
end


end