puts "What is your hamster's name?"
hamsters_name = gets.chomp
puts "What is your hamster's volume level (from 1 to 10)?"
hamster_volume = gets.chomp.to_i
puts "What is your hamster's fur color?"
fur_color = gets.chomp
puts "Do you think your hamster is good for adoption? (yes/no)"
adoption = gets.chomp
if adoption == 'yes'
	adoption = true
end
if adoption == 'no'
	adoption = false
end
puts "What is your hamster's estimated age?"
hamster_age = gets.chomp.to_f
if hamster_age == ""
	hamster_age = nil
end
puts "Your hamster's name is #{hamsters_name}."
puts "Your hamster's volume level is #{hamster_volume}/10."
puts "Your hamster's fur color is #{fur_color}."
puts "Your hamster's estimated age is #{hamster_age}."
puts "Hamster ready for adoption? #{adoption}."