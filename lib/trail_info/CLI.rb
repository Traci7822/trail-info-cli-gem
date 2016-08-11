require 'pry'

class TrailInfo::CLI


  def call
    puts "Welcome to Trail Finder!"
    menu    
  end

  def menu
    puts "What state would you like to find a trail in?"
    pick_location
    display_trails
  end
  
  def pick_location
    #populate locations hash using nokogiri

    locations = {
    "California" => ["San Diego", "Los Angeles", "San Francisco", "San Jose"],
    "New York" => [],
    "Texas" => [],
    "Washington" => []
    }
    
    @state_list = Hash.new
    @city_list = Hash.new
    
    locations.each_with_index do |state, index|
        @state_list = {(index + 1) => state}
        puts "#{@state_list.keys}. #{@state_list.values[0][0]}"
        end
   

   puts "You've selected #{state_selection}: #{states[state_selection.to_i - 1]}. Please select a city or enter 'go back' to return to the previous screen:"     #cities_array.each_with_index do |city, index| 
        #@city_list = {(index + 1) => city}
      #end
    #end

    #states.each_with_index { |state, index| puts "#{index + 1}: #{state}"}
    #state_selection = gets.chomp
    
     
    #direct towards city array/hash for state selection
    #populate cities hash w/ scraping 

    city_selection = gets.chomp
    puts "You've selected #{@city_list[city_selection.to_i - 1]}. Here are the available trails in #{@city_list[city_selection.to_i - 1]}"
        #ask for user input to select city
        #go back option
  end

  def display_trails
    #Trail list w/ attributes
    #option to select for more info
    #go back or reset option
  end

end
