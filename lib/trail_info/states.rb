class TrailInfo::State

attr_accessor :name

@@all = []

  def initialize(name)
    @name = name
    @trails = []
    doc

  end

  def doc
    @doc = Nokogiri::HTML(open("http://www.everytrail.com/browse.php?country=United+States&state=#{@name}"))
    binding.pry
    scrape_guides

  end

  def scrape_guides
    @doc.css(".guide-preview").each do |attribute|
      if attribute.css("a") != []
        new_trail = TrailInfo::Trail.new

        trail_name = attribute.css("a")[0].text
        trail_location = [attribute.css(".small-text" ".light-text").text.strip.split(", ")[0], attribute.css(".small-text" ".light-text").text.strip.split(", ")[1]].join(", ") 
        new_trail.name = trail_name
        new_trail.location = trail_location

        if attribute.css(".meta").text != "\n\t\t\t\t\t\t\t\t\t\t"
          trail_difficulty = attribute.css(".meta").text.split(" ")[0].gsub(/:/, "")
          trail_length = [attribute.css(".meta").text.split(" ")[1], attribute.css(".meta").text.split(" ")[2]].join(" ").gsub(/,/, "")
          trail_duration = [attribute.css(".meta").text.split(" ")[3], attribute.css(".meta").text.split(" ")[4]].join(" ").gsub(/,/, "")
  
          
          
          new_trail.difficulty = trail_difficulty
          new_trail.length = trail_length
          new_trail.duration = trail_duration
        end

        new_trail.state = self.name
        new_trail.save
        @trails << new_trail
      end
    end

    
     binding.pry
      trail_list
  end

  def trail_list
    @trails.each.with_index(1) do |trail, i| 
      puts "#{i}. #{trail.name} | Location: #{trail.location} | Difficulty: #{trail.difficulty} | Length: #{trail.length} | Duration: #{trail.duration}"
    end
  end

  def self.all
    @@all
  end
end
