class TrailInfo::Trail

attr_accessor :name, :length, :surface, :state, :synopsis, :url

@@all = []

def initialize(state, trail_attributes)
  trail_attributes.each do |attribute_name, attribute_value|
    self.send("#{attribute_name}=", attribute_value)
  end
  save
end

def save
  @@all << self
end

def self.all
  @@all
end

end