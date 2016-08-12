class TrailInfo::State

attr_accessor :name

@@all = []

  def initialize(name)
    @name = name
    trails = []
    @@all << self
    doc
  end

  def doc
    @doc = Nokogiri::HTML(open("http://www.everytrail.com/browse.php?country=United+States&state=#{@name}"))
    scrape_all
  end

  def scrape_all
    @trail_array = []
    @doc.css(".guide-preview").each do |attribute|
      if attribute.css("a") != []
        trail_name = attribute.css("a")[0].text 
        if attribute.css(".meta").text != "\n\t\t\t\t\t\t\t\t\t\t"
          trail_difficulty = attribute.css(".meta").text.split(" ")[0].gsub(/:/, "")
          trail_length = [attribute.css(".meta").text.split(" ")[1], attribute.css(".meta").text.split(" ")[2]].join(" ").gsub(/,/, "")
          trail_duration = [attribute.css(".meta").text.split(" ")[3], attribute.css(".meta").text.split(" ")[4]].join(" ").gsub(/,/, "")
          trail_location = [attribute.css(".small-text" ".light-text").text.strip.split(", ")[0], attribute.css(".small-text" ".light-text").text.strip.split(", ")[1]].join(", ")
          @trail_array.push([trail_name, trail_difficulty, trail_length, trail_duration, trail_location])
        end
      end
    end
    
      [0..@trail_array.size].to_a.each do |i|
        i = 0
        @trail_name = @trail_array[i][0]
        @trail_difficulty = @trail_array[i][1]
        @trail_length = @trail_array[i][2]
        @trail_duration = @trail_array[i][3]
        @trail_location = @trail_array[i][4]
        i += 1
      end

      trail = TrailInfo::Trail.new
      trail.name = @trail_name
      trail.length = @trail_length
      trail.difficulty = @trail_difficulty
      trail.duration = @trail_duration
      trail.location = @trail_location
      trail.state = self
      trail.save 
      
      #TrailInfo::Trail.create_state_array
  end

  def self.all
    @@all
  end
end
