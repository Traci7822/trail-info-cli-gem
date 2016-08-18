require 'pry'

class TrailInfo::CLI

  @@STATE_NAMES = {'AL'=>'ALABAMA',
  'AK'=>'ALASKA','AZ'=>'ARIZONA','AR'=>'ARKANSAS','CA'=>'CALIFORNIA','CO'=>'COLORADO','CT'=>'CONNECTICUT',
  'DE'=>'DELAWARE','DC'=>'DISTRICT OF COLUMBIA','FL'=>'FLORIDA','GA'=>'GEORGIA','HI'=>'HAWAII','ID'=>'IDAHO',
  'IL'=>'ILLINOIS','IN'=>'INDIANA','IA'=>'IOWA', 'KS'=>'KANSAS', 'KY'=>'KENTUCKY', 'LA'=>'LOUISIANA', 'ME'=>'MAINE',
  'MD'=>'MARYLAND', 'MA'=>'MASSACHUSETTS', 'MI'=>'MICHIGAN', 'MN'=>'MINNESOTA', 'MS'=>'MISSISSIPPI', 'MO'=>'MISSOURI',
  'MT'=>'MONTANA', 'NE'=>'NEBRASKA', 'NV'=>'NEVADA', 'NH'=>'NEW HAMPSHIRE', 'NJ'=>'NEW JERSEY', 'NM'=>'NEW MEXICO',
  'NY'=>'NEW YORK', 'NC'=>'NORTH CAROLINA', 'ND'=>'NORTH DAKOTA', 'OH'=>'OHIO', 'OK'=>'OKLAHOMA', 'OR'=>'OREGON', 
  'PA'=>'PENNSYLVANIA', 'RI'=>'RHODE ISLAND', 'SC'=>'SOUTH CAROLINA', 'SD'=>'SOUTH DAKOTA', 'TN'=>'TENNESSEE', 
  'TX'=>'TEXAS', 'UT'=>'UTAH', 'VT'=>'VERMONT', 'VA'=>'VIRGINIA', 'WA'=>'WASHINGTON', 'WV'=>'WEST VIRGINIA', 
  'WI'=>'WISCONSIN', 'WY'=>'WYOMING'}  

  def call
    puts "Welcome to Trail Finder!"
    menu  
  end

  def menu
    puts "Enter which state number you'd like to find a trail in and press enter or type 'exit' to exit the program.\n\n" 
    list_states
  end

  def list_states
    @@STATE_NAMES.each.with_index(1) do |state_name, index|
      puts "#{index}. #{state_name[1]}"
    end
    state_input
  end

  def state_input #allows user to select which state to view trails in
    selection = gets.strip.downcase
    list_trails(selection)
  end

  def list_trails(state_number) #checks input to determine whether to list trails or exit
    if state_number.to_i.between?(1, 51)
      initiate_trails_report(state_number.to_i)
    elsif 
      state_number == "exit"
      exit 
    else
      puts "Please enter a valid number between 1 - 51."
      state_input
    end
  end

  def initiate_trails_report(state_number) #Writes state selection, initiates new state instance, lists states trails
    puts "You've selected #{state_number}. #{@@STATE_NAMES.values[state_number - 1]}. Here are the available trails in #{@@STATE_NAMES[state_number]} according to TrailLink.com. This may take a moment to load.\n \n"
    initiate_state(state_number)
    list_trails_report
  end
  
  def initiate_state(state_number) #creates new state instance
    TrailInfo::State.new(@@STATE_NAMES.values[state_number - 1], @@STATE_NAMES.keys[state_number - 1])
  end

  def list_trails_report #populates trail list for selected state and asks for input for more details, reset, or exit
    TrailInfo::State.trail_list
    puts "\nPlease select a trail number to see more details, enter 'reset' to go back to the main menu, or 'exit' to exit the program."
    exit_input
  end

  def exit_input #takes user input and displays trail description, returns user to previous menus, or exits
    @trail_array = TrailInfo::State.all
    max_trail_number = @trail_array[0].trails.length
    input = gets.strip.downcase
    @trail_number = input.to_i
    if input.to_i.between?(1, max_trail_number)
      trail_description(@trail_array, @trail_number)
    else
      if input == 'back' ? list_trails_report : if input == "reset" ? TrailInfo::State.clear_all && call : (input == "exit" ? exit : (puts "I'm sorry, I don't understand. Please try again." && exit_input))
      end
      end
    end
  end

  def trail_description(trail_array, trail_number) #Writes detailed trail information and asks for user input
    trail = trail_array[0].trails[trail_number]
    puts "#{trail.name} | Length: #{trail.length} | Surface: #{trail.surface}|"
    puts "#{trail.synopsis}"
    puts "\nFor more information visit: #{trail.url}"
    puts "\nEnter 'back' to return to the list of trails, 'reset' to go back to the main menu, or 'exit' to exit the program."
    exit_input
  end
end

