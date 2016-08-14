require 'pry'
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

#def self.print_all
#  all.each_with_index do |trail, index|
#    puts "#{i}. #{trail.name} | Length: #{trail.length} | Surface: #{trail.surface}|"
#  end
#end

#def self.trails_by_state(state)
 # trail_list = []
 # self.all.each do |trail|
 #   if trail.state.name == selected_state.name
 #     trail_list << trail
#    end
 # end
#end



end