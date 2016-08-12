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
	puts "Enter 'a' to advance to the next day"
	puts "To quit, enter 'quit' or 'q' "

	response = gets.chomp

	if response == 'a'
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

time = Time.new.to_s.split(' ')[0].to_s

db = SQLite3::Database.new("results.db")

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

puts "Enter your usename to record in the game history"
username = gets.chomp

add_game(db, username, time, active_game.day, active_game.cash)


# Find player #
number = nil
cash = nil
place = nil
results = db.execute("select * from games order by id desc limit 1")
results.each do |result|
	number = result[0]
	cash = result[4]
end

# Find total number of players
index = 0
results = db.execute("select * from games order by cash desc")
results.each do |result|
	index += 1
	if result[4] == cash
		break
	end
end

if index == 1
	puts "*"*50
	puts "NEW HIGH SCORE! $#{cash}!"
	puts "*"*50
end

puts
puts "You finished ##{index}/#{number} total plays."




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



