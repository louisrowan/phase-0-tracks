class Santa
	attr_accessor :gender, :age
	attr_reader :ethnicity, :reindeer_ranking
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
end

=begin
test = Santa.new
test.speak
test.eat_milk_and_cookies "black and white cookie"
=end


# Initialize santas
=begin
santas = []
genders = "male female gender-fluid bigender male agender female"
ethnicities = "white black japanese universal latino spanish egyptian"
genders = genders.split(' ')
ethnicities = ethnicities.split(' ')
genders.length.times do |x|
	santas << Santa.new(genders[x], ethnicities[x])
end
=end

# driver code for 
=begin
my_santa = Santa.new "White", "Asian"
puts
my_santa.get_mad_at ("Donner")
p my_santa.gender #-> "white"
my_santa.gender = "Indian"
p my_santa.gender #-> "indian"
=end

genders = ["male", "female", "bi-gender", "gender fluid", "agender"]
ethnicities = ["black", "white", "european", "japanese", "indian", "egyptian", "moroccan", "brazilian", "australian"]
counter = 1
100.times do
	x = Santa.new("#{genders.sample}", "#{ethnicities.sample}")
	x.age = "#{rand(141)}".to_i
	p "This is Santa ##{counter}"
	p x.age
	p x.gender
	p x.ethnicity
	puts
	counter += 1
end