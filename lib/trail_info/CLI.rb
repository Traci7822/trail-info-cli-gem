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
    #Country list
    #ask for user input to select a country

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
