class TrailInfo::Trails

attr_accessor #:name, :rt_miles, :difficulty_rating, :location, :features, :elevation_gain

def self.list
  doc = Nokogiri::HTML(open("http://www.rockymountainhikingtrails.com/rocky-mountain-trails.htm"))
  binding.pry
  puts "self"
end

end