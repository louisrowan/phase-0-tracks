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

counter = 0

loop do
	puts
	puts "Day #{active_game.day}: What do you want to do?"
	puts "Enter 'hire' or 'h' to hire someone"
	puts "Enter 'operations' or 'o' to view the current state of your operations"
	puts "Enter 'advance' or 'a' to advance to the next day"
	puts "To quit, enter 'quit' or 'q' "

	if active_game.inventory <= active_game.sellers
		puts "-"*50
		puts "WARNING: INVENTORY LOW"
		puts "Hire some thieves or else your sellers will quit on you"
	end


	new_day = false
	while new_day != true

	puts

	res = gets.chomp

	
	if res == 'advance' || res == 'a'
		counter = 0
		if active_game.advance_day == 'game over'
			break
		end
		new_day = true
		next
	elsif res == 'hire' || res == 'h'
		puts
		puts "Do you want to hire a new seller or thief? Enter 'seller' or 'thief'"
		hire = gets.chomp
		puts
			if hire == 'seller'
				active_game.hire_seller
				puts "You now have #{active_game.sellers} sellers."
				counter += 1
			elsif hire == 'thief'
				active_game.hire_thief
				puts "You now have #{active_game.thieves} thieves."
				counter += 1
			else
				puts "That was not a valid response, try again"
			end
	elsif res == 'operations' || res == 'o'
		active_game.operations
	elsif res =='quit' || res == 'q'
		break
	else
		puts "Please enter a valid response"
	end

	if counter == 3
		puts "You have hired the maximum of 3 people in one day."
		puts "Advancing day..."
		if active_game.advance_day == 'game over'
			break
		end
		new_day = true
		counter = 0
	end

	puts "You can hire up to #{3-counter} more people today."
	puts "Enter 'hire' to hire more, or 'advance' to advance day."

end
end

puts "Congratulations, you made it #{active_game.day} days and made #{active_game.cash} cash."














require 'sqlite3'




# time
time = Time.new.to_s.split(' ')[0].to_s




db = SQLite3::Database.new("results.db")

db.execute("drop table games")


=begin
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS games(
    id INTEGER PRIMARY KEY,
    date VARCHAR(255),
    day INT,
    cash INT
  )
SQL

db.execute(create_table_cmd)

def add_game(db, value_time, value_day, value_cash)
	db.execute("insert into games (date, day, cash) values (?, ?, ?)", [value_time, value_day, value_cash])
end

add_game(db, time, active_game.day, active_game.cash)


# print all results
# results = db.execute("select * from games")
# results.each do |result|
# 	puts "#{result[1]}: You made it #{result[2]} days and earned #{result[3]} cash."
# end


puts "Do you want to view high scores? Enter 'yes' to view"
view_scores = gets.chomp
if view_scores == 'yes'
	# print out top 5
	puts "Top 5:"
	top5 = db.execute("select * from games order by cash desc limit 5")
	top5.each do |top|
		puts "#{top[1]}: You made it #{top[2]} days and earned #{top[3]} cash."
	end
end

=end