require 'pry'

class TrailInfo::CLI


  def call
    puts "Welcome to Trail Finder!"
    menu    
  end

  def menu
    puts "What Country would you like to find a trail in?"
    pick_location
    display_trails
  end
  
  def pick_location
    countries = ["United States", "United Kingdon", "Germany", "Japan"]
    puts "Please select a number to find a trail in that country then press enter."
    countries.each_with_index { |country, index| puts "#{index + 1}: #{country}"}
    country_selection = gets.chomp
    puts "You've selected #{country_selection}: #{countries[country_selection.to_i - 1]}. Please select a state:"

    states = ["California", "New York", "Texas", "Washington"]
    states.each_with_index { |state, index| puts "#{index + 1}: #{state}"}
    state_selection = gets.chomp
    puts "You've selected #{state_selection}: #{states[state_selection.to_i - 1]}. Please select a city or enter 'go back' to return to the previous screen:"

      #State List
      #ask for user input to select a state
      #go back option

        #City List
        #ask for user input to select city
        #go back option
  end

  def display_trails
    #Trail list w/ attributes
    #option to select for more info
    #go back or reset option
  end

end
