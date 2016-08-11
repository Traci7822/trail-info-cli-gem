require 'pry'

class TrailInfo::CLI


  def call
    puts "Welcome to Trail Finder!"
    menu    
  end

  def menu
    puts "Pick which state you'd like to find a trail in and press enter."
    pick_location
    display_trails
  end
  
  def pick_location
    #populate locations hash using nokogiri

    @locations = {
    "California" => ["San Diego", "Los Angeles", "San Francisco", "San Jose"],
    "New York" => [],
    "Texas" => [],
    "Washington" => []
    }

    pick_state
    pick_city
  end

  def pick_state
    @states = []
    @locations.keys.each_with_index do |state, i|
      @states << state
      puts "#{i + 1}. #{state}"
    end

    state_selection = gets.chomp
    puts "You've selected #{state_selection}. #{@states[state_selection.to_i - 1]}. Here are the best trails in #{@states[state_selection.to_i - 1]} according to EveryTrail.com. Enter 'reset' to go back to the menu."
    display_trails
    input = gets.chomp
    if input == "reset"
      menu
    end
  end


  def display_trails
    new_trail = TrailInfo::Trails.new
    new_trail.name = "Pine Ridge Trail to Sykes Hot Springs"
    new_trail.difficulty = "Difficult"
    new_trail.length = "20 miles"
    new_trail.duration = "Multiple Days"
    new_trail.location = "Pfeiffer Big Sur State Park"
    binding.pry
    #Trail list w/ attributes
    #go back or reset option
  end
end

=begin

  def pick_city
    @state_arrays = {}
    @cities = []
    @locations.keys.each do |state| #redundant. this recreates @locations but I like this version better
      @state_arrays[state] = @cities
  end
  #need to correlate city arrays with state selection. all states are populated with california cities now. 

    @locations.values.each do |city|
      city.each_with_index do |city, i|
        @cities << city
        puts "#{i + 1}. #{city}"
      end
    end

    city_selection = gets.chomp
    puts "You've selected #{city_selection}. #{@cities[city_selection.to_i - 1]}. Here are the available trails in #{@cities[city_selection.to_i - 1]}." 
  end

end


pick_city:
1. Alabama:
  1. Natural Wells Trail - Montesano State Park: Length: 6.2 miles, Duration: 4 hours, 
2. Alaska:
  1. East Fork Trail and Tulchina Falls: Difficulty: Moderate, Length: 6.3 miles, Duration: Half day
3. Arizona:
  

Trails

Difficulty, Length, Duration, Notes

=end