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
      new_trail = TrailInfo::Trail.new
      trail_name = scrape.css("a").text.split("\r\n                                                    ").join unless scrape.css("a").text.split("\r\n                                                    ") == ""
      
      scrape.css("p").each do |section|
        if section.text.include?("miles")
          @trail_length = [section.text.split[3], section.text.split[4]].join(" ")
        else
          @trail_length = ""
        end
      end
        
      scrape.css("p").children.each do |section|
        if section.include?("Surface:")
          @trail_surface = scrape.css("p")[1].children[10].text.split("\r\n").join.strip
        else
          @trail_surface = ""
        end
      end
      
      new_trail.name = trail_name            
      new_trail.length = @trail_length
      new_trail.surface = @trail_surface
      new_trail.state = self.name
      new_trail.save

      @trails << new_trail
    end
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
