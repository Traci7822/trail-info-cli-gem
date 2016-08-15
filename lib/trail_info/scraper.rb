class TrailInfo::Scraper

  def initialize(state_code) #Creates new scraper instance with state code
    @state_code = state_code
  end

  def self.create_trails(state_code) #Initiates state scrape
    scrape_state_guides(state_code)
  end

  def self.scrape_state_guides(state_code) #Scrapes state site, collects and returns trail information
    @state_scrape = Nokogiri::HTML(open("http://www.traillink.com/stateactivity/#{state_code}-hiking-trails.aspx"))
    scrape_attributes
    @trail_array
  end

  def self.scrape_attributes #Scrapes trail attributes and collects to trail_array
    @trail_array = []
    @state_scrape.css(".activityTrail").css(".trailmeta").each do |state_scrape|
      scrape_trail_attributes(state_scrape)
      @trail_array << @new_trail
    end
  end

  def self.scrape_trail_attributes(state_scrape) #Scrapes trail details
    @new_trail = {}
    @new_trail["synopsis"] = scrape_synopsis(state_scrape)
    @new_trail["name"] = scrape_trail_name(state_scrape)
    @new_trail["url"] = scrape_url(state_scrape)
    state_scrape.css("p").each do |trail_section|
      scrape_trail_length_and_surface(trail_section)
      @new_trail
    end
  end

  def self.scrape_trail_name(state_scrape) #Scrapes trail name
    state_scrape.css("a").text.split.join(" ") unless state_scrape.css("a").text.split.join(" ") == ""
  end

  def self.scrape_trail_length_and_surface(trail_section) #Scrapes trail length and surface information
    if trail_section.text.include?("miles") ? @new_trail["length"] = [trail_section.text.split[3], trail_section.text.split[4]].join(" ") : @new_trail["length"] = ""
    end

    if trail_section.text.include?("Surface:")
      if trail_section.text.split[7] == nil ? @new_trail["surface"] = trail_section.text.split[6] : @new_trail["surface"] = [trail_section.text.split[6], trail_section.text.split[7].gsub(/,/, "")].join(" ")
      end
    else
      @new_trail["surface"] = ""
    end
    @new_trail
  end

  def self.scrape_synopsis(state_scrape) #Scrapes trail synopsis
    @state_synopsis = state_scrape.css(".synopsis").text.strip
  end

  def self.scrape_url(state_scrape) #Scrapes trail url
    path = state_scrape.css("a").attribute("href").value
    state_url = "http://www.traillink.com#{path}"
  end

end