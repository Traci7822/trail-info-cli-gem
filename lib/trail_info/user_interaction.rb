class TrailInfo::UserInteraction

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

  def self.initiate_state(state_number)
    TrailInfo::State.new(@@STATE_NAMES.values[state_number - 1], @@STATE_NAMES.keys[state_number - 1])
  end

  def self.list_states
    @@STATE_NAMES.each.with_index(1) do |state_name, index|
      puts "#{index}. #{state_name[1]}"
    end
    selection = gets.strip
    if selection == "exit"
      exit
    else
      state_selection = selection.to_i
      TrailInfo::State.state_selection(@@STATE_NAMES, state_selection)
    end
  end

  def self.input
    input = gets.strip
    if input == "reset"
      TrailInfo::CLI.new.call
    elsif input == "exit"
      exit
    else
      puts "I'm sorry, I don't understand. Please try again."
      self.input
    end
  end

  def self.list_trails(state_number, state)
   if state_number.between?(1, 51)
     puts "You've selected #{state_number}. #{state}. Here are the available trails in #{state} according to TrailLink.com. This may take a moment to load.\n \n"
     initiate_state(state_number)
     puts "\nEnter 'reset' to go back to the main menu or 'exit' to leave the program."
     input
   elsif 
     state_number == "exit"
     exit      
   else
     puts "Please enter a valid number between 1 - 51."
     TrailInfo::States.state_selection(@@STATE_NAMES)
   end
 end

end


