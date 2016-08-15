# User interface:
# Most of the game is done in the class
# The interface creates a class instance, and loops through options to call
# different method on the class
# This file also connects to the database so scores are inputted and 
# user can view previous scores as well


require_relative 'game_class'

# Interface in a loop so multiple games can be played
while true

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


daily_hires = 0

while true

	if daily_hires == 2
		puts "You have hired the max amount for one day: 2. Advancing to next day..."
		5.times {puts}
		active_game.advance_day
		daily_hires = 0
	end

	puts
	puts "Day #{active_game.day}: What do you want to do?"
	puts "Enter 's' to hire a new seller"
	puts "Enter 't' to hire a new thief"
	puts "Enter 'o' to view the current state of your operations"
	puts "Enter 'a' or just hit enter to advance to the next day"
	puts "To quit, enter 'quit' or 'q' "

	response = gets.chomp

	if response == 'a' || response == ''
		active_game.advance_day
		daily_hires = 0
	elsif response == 's'
		active_game.hire_seller
		daily_hires += 1
	elsif response == 't'
		active_game.hire_thief
		daily_hires += 1
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







# Database interface
require 'sqlite3'

# Find date
time = Time.new.to_s.split(' ')[0].to_s

# Create database
db = SQLite3::Database.new("results.db")

# Add table with player id, username, date, days reached and cash total
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS games(
    id INTEGER PRIMARY KEY,
    username VARCHAR(255),
    date VARCHAR(255),
    days INT,
    cash INT
  )
SQL

db.execute(create_table_cmd)

def add_game(db, value_username, value_time, value_days, value_cash)
	db.execute("insert into games (username, date, days, cash) values (?, ?, ?, ?)", [value_username, value_time, value_days, value_cash])
end

# Get player username
puts "Enter your usename to record in the game history"
username = gets.chomp

# Add result into table
add_game(db, username, time, active_game.day, active_game.cash)


# Find total number of plays
number = nil
cash = nil
results = db.execute("select * from games order by id desc limit 1")
results.each do |result|
	number = result[0]
	cash = result[4]
end

# Find the player's rank for cash
index = 0
results = db.execute("select * from games order by cash desc")
results.each do |result|
	index += 1
	if result[4] == cash
		break
	end
end

# Message to print for a high score
if index == 1
	puts "*"*50
	puts "NEW HIGH SCORE! $#{cash}!"
	puts "*"*50
end

puts
puts "You finished ##{index}/#{number} total plays."



# Neatly prints out the final score
puts
puts "Your final score:"
results = db.execute("select * from games order by id desc limit 1")
results.each do |result|
	print "Username: #{result[1]}".ljust(20)
	print "Date: #{result[2]}".ljust(20)
	print "Days reached: #{result[3]}".ljust(20)
	print "Total cash: $#{result[4]}".ljust(20)
	puts
end



# Print out the top 5 scores in the database
puts
puts "Hit enter to view all-time high scores"
gets.chomp
puts
puts "Top 5 scores of all time:"
results = db.execute("select * from games order by cash desc limit 5")
results.each do |result|
	print "Username: #{result[1]}".ljust(20)
	print "Date: #{result[2]}".ljust(20)
	print "Days reached: #{result[3]}".ljust(20)
	print "Total cash: $#{result[4]}".ljust(20)
	puts
end




# Print out all scores for the player's username
puts
puts "Hit enter to view all scores from your username"
gets.chomp
puts
puts "Here are the top scores for your username:"
results = db.execute("select * from games where username = '#{username}' order by cash desc")
results.each do |result|
	print "Username: #{result[1]}".ljust(20)
	print "Date: #{result[2]}".ljust(20)
	print "Days reached: #{result[3]}".ljust(20)
	print "Total cash: $#{result[4]}".ljust(20)
	puts
end

# Play again?
puts
puts "Play again? Enter 'no' to quit"
play_again = gets.chomp
if play_again == 'no'.downcase || play_again == 'n'.downcase
	break
end
end