class TrailInfo::Scraper

  def initialize(state_code)
    @state_code = state_code
  end

  def self.create_trails(state_code)
    scrape_state_guides(state_code)
  end

  def self.scrape_state_guides(state_code) #fix sandwich code
    trail_array = []
    @state_scrape = Nokogiri::HTML(open("http://www.traillink.com/stateactivity/#{state_code}-hiking-trails.aspx"))
    @state_scrape.css(".activityTrail").css(".trailmeta").each do |state_scrape|
      new_trail = {}
      new_trail["name"] = state_scrape.css("a").text.split.join(" ") unless state_scrape.css("a").text.split.join(" ") == ""
      state_scrape.css("p").each do |trail_section|
        if trail_section.text.include?("miles") ? new_trail["length"] = [trail_section.text.split[3], trail_section.text.split[4]].join(" ") : new_trail["length"] = ""
        end

        if trail_section.text.include?("Surface:")
          if trail_section.text.split[7] == nil ? new_trail["surface"] = trail_section.text.split[6] : new_trail["surface"] = [trail_section.text.split[6], trail_section.text.split[7].gsub(/,/, "")].join(" ")
          end
        else
          new_trail["surface"] = ""
        end
      end
      trail_array << new_trail
    end
    trail_array
  end

end