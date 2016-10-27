# Virus Predictor

# I worked on this challenge [by myself, with: Samantha  ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# the difference between require_relative vs require is that 
# require_relative allows you access a file using the relative path to the root 
# and adds a file that's already been installed. 
#
#
require_relative 'state_data'

class VirusPredictor
  attr_accessor :speed 

# this method its setting the attributes of each new instances of the class
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

# this method runs the predicted_deaths and speed_of_spread methods.
  def virus_effects
   predicted_deaths(@population_density, @population, @state, speed)
  end

  #private

# this method calculates predicted deaths based off population density and
# population and returns the result
  def predicted_deaths(population_density, population, state, speed)
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

    puts "#{@state} will lose #{number_of_deaths} people in this outbreak and will spread across the state in #{@speed} months.\n\n"
  end


# this method calculates how fast the virus spreads based of the population density 
  def speed_of_spread(population_density, state) #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end
    
  end

def speed 
  @speed = speed_of_spread(@population_density, @state)
end 

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |state, data|
  VirusPredictor.new(state, data[:population_density], data[:population]).virus_effects
end 




#=======================================================================
# Reflection Section

