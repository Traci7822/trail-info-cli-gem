class TrailInfo::Trail

attr_accessor :name, :length, :duration, :location, :difficulty, :state

@@all = []
@state = []

def initialize
  @name = name
end

def save
  @@all << self
end

def self.all
  @@all
end

def self.create_state_array
  @@all.each do |trail|

  end
end


end