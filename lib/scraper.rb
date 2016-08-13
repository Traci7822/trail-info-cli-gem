class Scraper

  def self.state_scraper
    @state_scrape = Nokogiri::HTML(open("http://www.traillink.com/stateactivity/#{@state_code}-hiking-trails.aspx"))
    scrape_guides
  end

  def scrape_state_guides
    @doc.css(".activityTrail").css(".trailmeta").each do |state_scrape|
      new_trail = TrailInfo::Trail.new
      new_trail.name = state_scrape.css("a").text.split.join(" ") unless state_scrape.css("a").text.split.join(" ") == ""
      state_scrape.css("p").each do |trail_section|
        if trail_section.text.include?("miles")
          new_trail.length = [trail_section.text.split[3], trail_section.text.split[4]].join(" ")
        else
          new_trail.length = ""
        end

        if trail_section.text.include?("Surface:")
           if trail_section.text.split[7] == nil
              new_trail.surface = trail_section.text.split[6]
            else
              new_trail.surface = [trail_section.text.split[6], trail_section.text.split[7].gsub(/,/, "")].join(" ")
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