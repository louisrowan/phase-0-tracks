class Puppy
	def initialize
		puts "Initializing new puppy instance..."
	end

	def fetch(toy)
		puts "I brought back the #{toy}"
		toy
	end

	def speak(number_of_times)
		puts "Woof! "*number_of_times
	end

	def roll_over
		puts "*rolls over*"
	end

	def dog_years(human_years)
		return human_years*7
	end

	def name(name)
		return "This puppy is named #{name}"
	end

end

=begin
my_puppy = Puppy.new
my_puppy.fetch("chew toy") #-> I brought back the chew toy
my_puppy.speak(12) #-> Woof! Woof! Woof! Woof! Woof! Woof! Woof! Woof! Woof! Woof! Woof! Woof!
my_puppy.roll_over #-> *rolls over*
p my_puppy.dog_years(5) #-> 35
p my_puppy.name("Jonathan") #-> "This puppy is named Jonathan"
=end

# Initialize runs when a new instance is first created
# If you misspell it ruby will not give you an error message
# It just becomes a new method that is never called and thus
# is never run.

# Release 2: