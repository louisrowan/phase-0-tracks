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
end

=begin
test = Santa.new
test.speak
test.eat_milk_and_cookies "black and white cookie"
=end


# Initialize santas
=begin
santas = []
puts "Enter gender, ethnicity like this:"
puts "Female, Japanese"
puts "Press return when finished"
puts

response = nil
until response == ''
	response = gets.chomp
	response_split = response.split(',')
	santas << Santa.new(response_split[0], response_split[1])
end

puts santas
=end