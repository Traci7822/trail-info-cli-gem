class TrailInfo::CLI

  def call
    puts "Welcome to Trail Finder!"
    menu  
    pick_state  
  end

  def menu
    puts "Enter which state number you'd like to find a trail in and press enter or type 'exit' to exit the program." 
  end

  def pick_state
    TrailInfo::UserInteraction.list_states  
  end

end

