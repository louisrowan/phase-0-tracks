# Virus Predictor

# I worked on this challenge [by myself, with: Miles M].
# We spent [1.5] hours on this challenge.

# EXPLANATION OF require_relative
# #require_relative  allows us to pull data/code from another file in some cases another directory and allows the infiormation to be used together.Require allows us to allows us to pull code from built in ruby features rather than indicated files.
require_relative 'state_data'

class VirusPredictor
  # When a new instance of virus predictor is created it declares and give values to our instance variables. 
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
  # runs thwo methods later defines in the class
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private
# this method takes our instance variables as arguments and calculates a new  rounded down value for number of deaths based on  population and states then prints a result.
  def predicted_deaths
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

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end
# this method takes 2 arguments and sets a new speed variable  then recalculates the speed varibale based on population density.
  def speed_of_spread #in months
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

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

=begin
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects
=end
STATE_DATA.each do|state_key, state_attributes|
  state = VirusPredictor.new(state_key, state_attributes[:population_density],state_attributes[:population])
  state.virus_effects
end 

#=======================================================================
# Reflection Section
=begin
What are the differences between the two different hash syntaxes as shown in state_data?

The first syntax uses the hash rocket symbol '=>' to separate the key from hash, and there
is flexibility in the data type for the key, such as a string or a integer. The second
syntax uses symbols as the keys, when using symbols, no hash rocket is needed, and instead
of putting the ':' before the name of the symbol like usual, the colon is put after.

--
What does require_relative do? How is it different from require?

Require_relative pulls in code from other files, located relative to the current file.
For instance, for code in the same directory as the current file, the relative path is
simply the file name. When a file is specified in require_relative, all of the code
from that file is copied into the current file, such as any classes or created methods.
The require method is for importang any outside code, like gems into the file. These
can be downloaded online.

--
What are some ways to iterate through a hash?

One way is '.each', it will iterate through each key/value pair in the hash, with
a variable representing the key and another representing the hash. Another way would be to
sort only through the keys, using '.keys.each', in this case only one variable (for keys)
are created.

--
When refactoring virus_effects, what stood out to you about variables?

What stood out is that private instance methods often do not need any parameters.
This is because such methods cannot be called from outside of the class, only
inside. And since they can only be called inside the class, the instance variables
are already defined in the class and do not need to be inputted as arguments.
Wirth the virus_effects method, population density, number of deaths and population
were already created on initialization so there was no need to also set them as parameters.

--
What concept did you most solidify in this challenge?

For me it was the idea of refractoring code to make it more DRY and efficient. Sometimes
the code I write is very tedious and my focus is only on if it works, not how it looks or how 
DRY it is. I'm starting to realize that when first writing code it might be a little wordy,
but once working it is often very possible to slim it down and make it much more efficient.
=end