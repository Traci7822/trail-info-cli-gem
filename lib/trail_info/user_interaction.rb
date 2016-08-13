require 'Nokogiri'
require 'open-uri'

class TrailInfo::UserInteraction
  
  @@STATE_NAMES = {'AL'=>'ALABAMA',
  'AK'=>'ALASKA','AZ'=>'ARIZONA','AR'=>'ARKANSAS','CA'=>'CALIFORNIA','CO'=>'COLORADO','CT'=>'CONNECTICUT','DE'=>'DELAWARE','DC'=>'DISTRICT OF COLUMBIA','FL'=>'FLORIDA','GA'=>'GEORGIA','HI'=>'HAWAII','ID'=>'IDAHO','IL'=>'ILLINOIS','IN'=>'INDIANA','IA'=>'IOWA',
  'KS'=>'KANSAS', 'KY'=>'KENTUCKY', 'LA'=>'LOUISIANA', 'ME'=>'MAINE', 'MD'=>'MARYLAND', 'MA'=>'MASSACHUSETTS', 'MI'=>'MICHIGAN', 'MN'=>'MINNESOTA', 'MS'=>'MISSISSIPPI', 'MO'=>'MISSOURI', 'MT'=>'MONTANA', 'NE'=>'NEBRASKA', 'NV'=>'NEVADA', 'NH'=>'NEW HAMPSHIRE', 
  'NJ'=>'NEW JERSEY', 'NM'=>'NEW MEXICO', 'NY'=>'NEW YORK', 'NC'=>'NORTH CAROLINA', 'ND'=>'NORTH DAKOTA', 'OH'=>'OHIO', 'OK'=>'OKLAHOMA', 'OR'=>'OREGON', 'PA'=>'PENNSYLVANIA', 'RI'=>'RHODE ISLAND', 'SC'=>'SOUTH CAROLINA', 'SD'=>'SOUTH DAKOTA', 'TN'=>'TENNESSEE', 
  'TX'=>'TEXAS', 'UT'=>'UTAH', 'VT'=>'VERMONT', 'VA'=>'VIRGINIA', 'WA'=>'WASHINGTON', 'WV'=>'WEST VIRGINIA', 'WI'=>'WISCONSIN', 'WY'=>'WYOMING'}  

  def self.list_states
    @@STATE_NAMES.each.with_index(1) do |state_name, index|
      puts "#{index}. #{state_name[1]}"
    end
    state_selection
  end

  def self.state_selection 
    state_number = gets.strip.to_i
    puts "You've selected #{state_number}. #{@@STATE_NAMES.values[state_number - 1]}. Here are the available trails in #{@@STATE_NAMES.values[state_number - 1]} according to TrailLink.com."
    state = TrailInfo::State.new(@@STATE_NAMES.values[state_number - 1], @@STATE_NAMES.keys[state_number - 1])
    puts "Enter 'reset' to go back to the main menu or 'exit' to leave the program."
    input
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

end


