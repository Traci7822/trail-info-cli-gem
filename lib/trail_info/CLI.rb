require 'pry'

class TrailInfo::CLI

  attr_accessor :states

  def call
    puts "Welcome to Trail Finder!"
    menu    
  end

  def menu
    puts "Pick which state you'd like to find a trail in and press enter."
    pick_state #trails.all(?)
    display_trails
  end

  def pick_state
    TrailInfo::Trails.list_states
    
    input = gets.chomp #use .strip instead
    if input == "reset"
      menu
    end
  end

  def display_trails
    TrailInfo::Trails.create_trails.values.each_with_index do |name, index| #each.with_index(1) will start at index = 1
      index = index.to_i
      while index <= 20
        puts "#{index + 1}. #{name[index].values[0]} | Location: #{name[index].values[4]} | Difficulty: #{name[index].values[1]} | Length: #{name[index].values[2]} | Duration: #{name[index].values[3]}"
        index += 1
      end
    end
  end

end

