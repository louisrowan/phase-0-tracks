# Game ideas:
# Purpose: Run a street operation selling illicit goods
# types of goods:
# 1. bootleg CDs
# 2. bootleg movies
# 3. Knockoff clothing
# 4. Stolen TVs
# 5. Stolen computers

# types of actions that can be taken:
# 1. Hiring
# people to hire:
# a. Salespeople - sell goods
# b. Thiefs - obtain goods
# c. Crooked cop - helps keep from getting caught

# 2. Increase territory in the city
# when trying to increase territory:
# 	a. chance of gaining territory which leads to more Sales
# # 	b. chance of getting caught and staff being arrested

# 3. advance one day


class Game

	def initialize
		@cash = 100
		@sellers = 1
		@thiefs = 1
		@police = 0
		@cds = 5
		@day = 1
	end


	def daily_sales
		daily_sellers = @sellers
		daily_profit = daily_sellers*20
		@cds -= daily_sellers
		@cash += daily_profit
	end

	def daily_thievery
		@cds += (@thiefs)*3
	end


	def advance_day
		@day += 1
		pay_workers
		daily_sales
		daily_thievery
		status
	end

	def pay_workers
		@cash -= (@sellers + @thiefs)*10
	end

	def hire_seller
		@sellers += 1
	end

	def hire_thief
		@thiefs += 1
	end


	def status
		puts "Day #{@day}: #{@cash} cash, #{@cds} cds, #{@sellers} sellers."
	end

end

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