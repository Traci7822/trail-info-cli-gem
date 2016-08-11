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
    
      #need to create arrays for each state in which to house all of the states trails

    pick_state
  end

  def pick_state
    @trails = ["trail1", "trail2", "trail3"]
    @states = ["California", "New York", "Texas", "Washington"]
    
    @states.each_with_index do |state, i|
      puts "#{i + 1}. #{state}"
    end

    state_selection = gets.chomp
    puts "You've selected #{state_selection}. #{@states[state_selection.to_i - 1]}. Here are the 20 best trails in #{@states[state_selection.to_i - 1]} according to EveryTrail.com. Enter 'reset' to go back to the menu."
    display_trails(@trails)

    input = gets.chomp
    if input == "reset"
      menu
    end
  end

  def display_trails(trails_array)
    TrailInfo::Trails.create_trails(trails_array)
    @trails.each_with_index do |trail, index|
      puts "#{index + 1}. #{trail}"
    end
  end
end

 
