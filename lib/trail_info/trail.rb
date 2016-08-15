class TrailInfo::Trail

attr_accessor :name, :length, :surface, :state, :synopsis, :url

@@all = []

def initialize(state, trail_attributes) #Creates new trail instance
  trail_attributes.each do |attribute_name, attribute_value|
    self.send("#{attribute_name}=", attribute_value)
  end
  save
end

def save #saves trail instance
  @@all << self
end

def self.all #returns all trail instances
  @@all
end

end