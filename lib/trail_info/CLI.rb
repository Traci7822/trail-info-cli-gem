require 'pry'

class TrailInfo::CLI

  def call
    puts "Welcome to Trail Finder!"
    menu    
  end

  def menu
    puts "Enter which state number you'd like to find a trail in and press enter."
    pick_state
  end

  def pick_state
    TrailInfo::UserInteraction.list_states  
  end

end

