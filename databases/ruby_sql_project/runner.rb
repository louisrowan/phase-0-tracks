require_relative 'game_class'

puts
puts "Welcome to a new game of STREET CHAMPION"
puts
puts "In this game you are the head of an underground organization selling illicit goods"
puts "Your goal is to obtain as much cash as possible before you are inevitably caught by the cops"
puts "You can hire street thieves to amass inventory and street dealers to sell your inventory"
puts "Reaching certain milestones will unlock new levels and greatly increase profits!"
puts "Beware: Game will end if you run out of cash or inventory"
puts
puts


active_game = Game.new



while true
	puts
	puts "Day #{active_game.day}: What do you want to do?"
	puts "Enter 's' to hire a new seller"
	puts "Enter 't' to hire a new thief"
	puts "Enter 'o' to view the current state of your operations"
	puts "Enter 'a' to advance to the next day"
	puts "To quit, enter 'quit' or 'q' "

	response = gets.chomp

	if response == 'a'
		active_game.advance_day
	elsif response == 's'
		active_game.hire_seller
	elsif response == 't'
		active_game.hire_thief
	elsif response == 'o'
		active_game.operations
	elsif response == 'q' || response == 'quit'
		break
	else
		puts "Please enter a valid response"
	end

	if active_game.active == false
		break
	end

end