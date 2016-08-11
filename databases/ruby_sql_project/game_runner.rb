require_relative 'game_class'

puts 'hit return for automatic interface'
ans = gets.chomp
if ans == ''
	active_game = Game.new
	active_game.advance_day
	active_game.advance_day
	active_game.advance_day
	active_game.hire_seller
	active_game.hire_thief
	active_game.hire_seller
	active_game.advance_day
	active_game.advance_day
	active_game.advance_day
	active_game.advance_day
	active_game.advance_day
else
	active_game = Game.new
	while true
		puts 'what do you want to do? a=advance, s=hire seller, t=hire thief, .=status'
		res = gets.chomp
		if res == 'a'
			if active_game.advance_day == 'game over'
				break
			end
		elsif res == 's'
			active_game.hire_seller
		elsif res == 't'
			active_game.hire_thief
		elsif res == '.'
			active_game.status
		elsif res == 'o'
			active_game.operations
		elsif res =='quit'
			break
		end
	end
end

puts "Congratulations, you made it #{active_game.day} days and made #{active_game.cash} cash."


time = Time.new
time = time.to_s
time = time.split(' ')
time = time[0]
time = time.to_s
puts time


# Database stuff
require 'sqlite3'

db = SQLite3::Database.new("results.db")

db.execute("drop table games")

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



results = db.execute("select * from games")
results.each do |result|
	puts "#{result[1]}: You made it #{result[2]} days and earned #{result[3]} cash."
end


#print out top 5
puts "Top 5:"
top5 = db.execute("select * from games order by cash desc limit 5")
top5.each do |top|
	puts "#{top[1]}: You made it #{top[2]} days and earned #{top[3]} cash."
end