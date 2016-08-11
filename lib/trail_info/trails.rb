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
      
  end

  def self.create_trails #creates hashes of trails and adds them to @trails array   
    @@STATE_NAMES.each do |state|
      state
      doc = Nokogiri::HTML(open("http://www.everytrail.com/browse.php?country=United+States&state=#{state}"))
      doc.css(".content").each do |attribute|
        trail = {
          "name" => "#{attribute.css("a")[0].text}",
          "difficulty" => "#{attribute.css(".meta").text.split(" ")[0].sub(/:/, "")}",
          "length" => "#{attribute.css(".meta").text.split(" ")[1]} #{attribute.css(".meta").text.split(" ")[2].sub(/,/, "")}",
          "duration" => "#{attribute.css(".meta").text.split(" ")[3]} #{attribute.css(".meta").text.split(" ")[4]}",
          "location" => "#{attribute.css(".small-text" ".light-text").text.split(" ")[0]} #{attribute.css(".small-text" ".light-text").text.split(" ")[1].sub(/,/, "")}"
        }
        @trails << trail
        binding.pry
      end
    end

    #@state_trails.each do |trail| #doc.css... each do 
      #i = 0
      #trail = {
       # "name" => , 
       # "difficulty" => "Difficult",
       # "length" => "20 miles",
       # "duration" => "Multiple Days",
       # "location" => "Pfeiffer Big Sur State Park"
       # }
       # i += 1
         #make sure it's just passing the states trails to @states, not all trails
    
    create_state_trails
  end

  def self.create_state_trails #creates array of state names and their trail arrays
    @states = Hash[@@STATE_NAMES.map {|state| [state, @trails]}] #possibly call create_trails instead of @trails
  end

  def self.all
    @@all
  end


end
