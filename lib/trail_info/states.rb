class TrailInfo::State

attr_accessor :name

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
      new_trail.name = scrape.css("a").text.split.join(" ") unless scrape.css("a").text.split.join(" ") == ""
      scrape.css("p").each do |section|
        if section.text.include?("miles")
          new_trail.length = [section.text.split[3], section.text.split[4]].join(" ")
        else
          new_trail.length = ""
        end

        if section.text.include?("Surface:")
           if section.text.split[7] == nil
              new_trail.surface = section.text.split[6]
            else
              new_trail.surface = [section.text.split[6], section.text.split[7]].join(" ")
            end
        else
          new_trail.surface = ""
        end
      end
      
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

end
