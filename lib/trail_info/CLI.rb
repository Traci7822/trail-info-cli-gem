require 'pry'

class TrailInfo::CLI

  attr_accessor :states

  def call
    puts "Welcome to Trail Finder!"
    menu    
  end

  def menu
    puts "Pick which state you'd like to find a trail in and press enter."
    pick_state
    display_trails
  end

  def pick_state
    TrailInfo::Trails.create_trails.keys.each_with_index do |state, i|
      @state = state
      puts "#{i + 1}. #{@state}"
    end

    state_selection = gets.chomp
    puts "You've selected #{state_selection}. #{@state}. Here are the 20 best trails in #{@state} according to EveryTrail.com. Enter 'reset' to go back to the menu."
    display_trails

    input = gets.chomp
    if input == "reset"
      menu
    end
  end

  def display_trails
    TrailInfo::Trails.create_trails.values.each_with_index do |name, index|
      i = 0
      puts "#{index + 1}. #{name[i].values[0]} | Location: #{name[i].values[4]} | Difficulty: #{name[i].values[1]} | Length: #{name[i].values[2]} | Duration: #{name[i].values[3]}"
      i += 1
    end
  end

end
