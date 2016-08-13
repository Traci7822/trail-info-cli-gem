class TrailInfo::Trail

attr_accessor :name, :length, :surface, :state

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