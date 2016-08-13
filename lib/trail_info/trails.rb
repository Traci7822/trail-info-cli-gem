require 'Nokogiri'
require 'open-uri'

class TrailInfo::Trails

  attr_accessor :name, :difficulty, :length, :duration, :location, :state #may or may not need

  @@all = []
  
  @@STATE_NAMES = {'AL'=>'ALABAMA',
  'AK'=>'ALASKA','AZ'=>'ARIZONA','AR'=>'ARKANSAS','CA'=>'CALIFORNIA','CO'=>'COLORADO','CT'=>'CONNECTICUT','DE'=>'DELAWARE','DC'=>'DISTRICT OF COLUMBIA','FL'=>'FLORIDA','GA'=>'GEORGIA','HI'=>'HAWAII','ID'=>'IDAHO','IL'=>'ILLINOIS','IN'=>'INDIANA','IA'=>'IOWA',
  'KS'=>'KANSAS', 'KY'=>'KENTUCKY', 'LA'=>'LOUISIANA', 'ME'=>'MAINE', 'MD'=>'MARYLAND', 'MA'=>'MASSACHUSETTS', 'MI'=>'MICHIGAN', 'MN'=>'MINNESOTA', 'MS'=>'MISSISSIPPI', 'MO'=>'MISSOURI', 'MT'=>'MONTANA', 'NE'=>'NEBRASKA', 'NV'=>'NEVADA', 'NH'=>'NEW HAMPSHIRE', 
  'NJ'=>'NEW JERSEY', 'NM'=>'NEW MEXICO', 'NY'=>'NEW YORK', 'NC'=>'NORTH CAROLINA', 'ND'=>'NORTH DAKOTA', 'OH'=>'OHIO', 'OK'=>'OKLAHOMA', 'OR'=>'OREGON', 'PA'=>'PENNSYLVANIA', 'RI'=>'RHODE ISLAND', 'SC'=>'SOUTH CAROLINA', 'SD'=>'SOUTH DAKOTA', 'TN'=>'TENNESSEE', 
  'TX'=>'TEXAS', 'UT'=>'UTAH', 'VT'=>'VERMONT', 'VA'=>'VIRGINIA', 'WA'=>'WASHINGTON', 'WV'=>'WEST VIRGINIA', 'WI'=>'WISCONSIN', 'WY'=>'WYOMING'}  

  #def initialize(state)
   #   @state = state #why?
  #end

  def self.list_states
    @@STATE_NAMES.each.with_index(1) do |state_name, index|
      puts "#{index}. #{state_name[1]}"
    end

    state_number = gets.strip.to_i
    puts "You've selected #{state_number}. #{@@STATE_NAMES.values[state_number]}. Here are the 20 best trails in #{@@STATE_NAMES.values[state_number]} according to EveryTrail.com. Enter 'reset' to go back to the menu."
    state = TrailInfo::State.new(@@STATE_NAMES.values[state_number], @@STATE_NAMES.keys[state_number])
      #displays State::Trail list
  end


  #def self.create_state_trails #creates array of state names and their trail arrays
  #  @states = Hash[@@STATE_NAMES.map {|state| [state, @trails]}] #possibly call create_trails instead of @trails
  #end

  def self.all
    @@all
  end
end


