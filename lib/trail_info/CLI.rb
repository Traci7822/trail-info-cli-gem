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
    puts "You've selected #{state_selection}. #{@states[state_selection.to_i - 1]}. Please select a city or enter 'go back' to return to the previous screen:"
  end

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

  def display_trails
    #Trail list w/ attributes
    #option to select for more info
    #go back or reset option
  end

end
