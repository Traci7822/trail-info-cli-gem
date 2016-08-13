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

  def self.list_states
    @@STATE_NAMES.each.with_index(1) do |state_name, index|
      puts "#{index}. #{state_name[1]}"
    end
    state_input
  end

  def self.state_input
    selection = gets.strip
    list_trails(selection.to_i) unless selection == "exit"
  end

  def self.exit_input
    input = gets.strip
    if input == "reset" ? TrailInfo::CLI.new.call : (input == "exit" ? exit : (puts "I'm sorry, I don't understand. Please try again." && exit_input))
    end
  end

  def self.list_trails(state_number)
   if state_number.between?(1, 51)
     puts "You've selected #{state_number}. #{@@STATE_NAMES.values[state_number - 1]}. Here are the available trails in #{@@STATE_NAMES[state_number]} according to TrailLink.com. This may take a moment to load.\n \n"
     initiate_state(state_number)
     puts "\nEnter 'reset' to go back to the main menu or 'exit' to leave the program."
     exit_input
   elsif 
     state_number == "exit"
     exit      
   else
     puts "Please enter a valid number between 1 - 51."
     state_input
   end
 end

  def self.initiate_state(state_number)
    TrailInfo::State.new(@@STATE_NAMES.values[state_number - 1], @@STATE_NAMES.keys[state_number - 1])
  end

end


