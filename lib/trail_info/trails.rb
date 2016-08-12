require 'Nokogiri'
require 'open-uri'

class TrailInfo::Trails

  attr_accessor :name, :difficulty, :length, :duration, :location, :state #may or may not need

  @@all = []
  @@STATE_NAMES = [
  'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'District of Columbia', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois',
  'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska',
  'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 
  'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
  @trails = []

  def initialize(state)
      @state = state #why?
  end

  def self.list_states
    @@STATE_NAMES.each.with_index(1) do |state, index|
      puts "#{index}. #{state}"
    end
    @state_selection = gets.strip.to_i
    puts "You've selected #{@state_selection}. #{@@STATE_NAMES[@state_selection - 1]}. Here are the 20 best trails in #{@@STATE_NAMES[@state_selection - 1]} according to EveryTrail.com. Enter 'reset' to go back to the menu."
    doc
    scrape_all
  end

  def self.doc
    doc = Nokogiri::HTML(open("http://www.everytrail.com/browse.php?country=United+States&state=#{@@STATE_NAMES[@state_selection]}"))
  end

  def self.scrape_all
    @trail_array = []

    doc.css(".guide-preview").each do |attribute|
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
        trail_name = @trail_array[i][0]
        trail_difficulty = @trail_array[i][1]
        trail_length = @trail_array[i][2]
        trail_duration = @trail_array[i][3]
        trail_location = @trail_array[i][4]
      end

      trail = Trail.new
      trail.name = trail_name
      trail.length = trail_length
      trail.difficulty = trail_difficulty
      trail.duration = trail_duration
      trail.location = trail_location
      trail.save
 
  end

  def self.create_trails #creates hashes of trails and adds them to @trails array 
  scrape_all   
  end

  def self.create_state_trails #creates array of state names and their trail arrays
    @states = Hash[@@STATE_NAMES.map {|state| [state, @trails]}] #possibly call create_trails instead of @trails
  end

  def self.all
    @@all
  end
end


