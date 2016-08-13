class TrailInfo::State

  attr_accessor :name
  @@all = []

  def initialize(name, state_code,)
    @name = name
    @state_code = state_code
    
    #where is trails_array coming from?
    @trails = trails_array.collect do |trail_attributes|
      TrailInfo::Trail.new(self, trail_attributes)
    end

    doc
    @@all << self

    trail_list
  end

  def self.all
    @@all
  end

  def self.trail_list
    @trails.each.with_index(1) do |trail, i| 
      puts "#{i}. #{trail.name} | Length: #{trail.length} | Surface: #{trail.surface}|"
    end
  end

end
