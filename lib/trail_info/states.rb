class TrailInfo::State

attr_accessor :name

@@all = []

  def initialize(name, code)
    @name = name
    @code = code
    @trails = []
    doc
  end


  def doc
    @doc = Nokogiri::HTML(open("http://www.traillink.com/stateactivity/#{@code}-hiking-trails.aspx"))
    scrape_guides

  end

  def scrape_guides
    @doc.css(".activityTrail").css(".trailmeta").each do |scrape|
      binding.pry
      new_trail = TrailInfo::Trail.new
  
      trail_name = scrape.css("a").text.split("\r\n                                                    ") unless scrape.css("a").text.split("\r\n                                                    ") == ""     
      new_trail.name = trail_name      
      #need to figure out following attributes
      trail_length = [attribute.css(".meta").text.split(" ")[1], attribute.css(".meta").text.split(" ")[2]].join(" ").gsub(/,/, "")
      trail_surface = [attribute.css(".meta").text.split(" ")[3], attribute.css(".meta").text.split(" ")[4]].join(" ").gsub(/,/, "")
  
          
          
          
          new_trail.length = trail_length
          new_trail.surface = trail_surface
     end

        new_trail.state = self.name
        new_trail.save
        @trails << new_trail
      
    

    
      trail_list
  end

  def trail_list
    @trails.each.with_index(1) do |trail, i| 
      puts "#{i}. #{trail.name} | Length: #{trail.length} | Surface: #{trail.surface}|"
    end
  end

  def self.all
    @@all
  end
end
