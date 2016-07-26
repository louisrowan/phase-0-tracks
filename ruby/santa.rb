class Santa
	def initialize (gender, ethnicity)
		puts "Initializing Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen",
			"Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end
	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies (cookie)
		puts "That was a good #{cookie}!"
	end

	def celebrate_birthday
		@age += 1
	end

	def get_mad_at (reindeer_name)
		@reindeer_ranking.insert(-1, @reindeer_ranking.delete_at(@reindeer_ranking.index(reindeer_name)))
	end

	def ranking
		puts @reindeer_ranking
	end

	def gender= (gender)
		@gender = gender
	end

	def age
		@age
	end

	def ethnicity
		@ethniicity
	end
end

=begin
test = Santa.new
test.speak
test.eat_milk_and_cookies "black and white cookie"
=end


# Initialize santas
santas = []
genders = "male female gender-fluid bigender male agender female"
ethnicities = "white black japanese universal latino spanish egyptian"
genders = genders.split(' ')
ethnicities = ethnicities.split(' ')
genders.length.times do |x|
	santas << Santa.new(genders[x], ethnicities[x])
end



my_santa = Santa.new "White", "Asian"
my_santa.ranking
puts
my_santa.get_mad_at ("Donner")
my_santa.ranking
my_santa.gender = "Indian"
my_santa.age
