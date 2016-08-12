require 'Nokogiri'
require 'open-uri'

class TrailInfo::Trails

  attr_accessor :name, :difficulty, :length, :duration, :location, :state #may or may not need

  @@all = []
  @@STATE_NAMES = [
  'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'District of Columbia', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois',
  'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska',
  'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 
  'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
  

  #def initialize(state)
   #   @state = state #why?
  #end

  def self.list_states
    @@STATE_NAMES.each.with_index(1) do |state, index|
      puts "#{index}. #{state}"
    end
    state_number = gets.strip.to_i
    state_selection = @@STATE_NAMES[state_number - 1]
    puts "You've selected #{state_number}. #{state_selection}. Here are the 20 best trails in #{state_selection} according to EveryTrail.com. Enter 'reset' to go back to the menu."
    state = TrailInfo::State.new(state_selection)
    
    #displays State::Trail list
  end


  #def self.create_state_trails #creates array of state names and their trail arrays
  #  @states = Hash[@@STATE_NAMES.map {|state| [state, @trails]}] #possibly call create_trails instead of @trails
  #end

  def self.all
    @@all
  end
end


