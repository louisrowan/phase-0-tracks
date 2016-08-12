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

# print all results
results = db.execute("select * from games")
results.each do |result|
	puts "Username: #{result[1]}; Date: #{result[2]}; Days reached: #{result[3]}; Total cash: $#{result[4]}"
end

puts "Do you want "
db_answer = gets.chomp