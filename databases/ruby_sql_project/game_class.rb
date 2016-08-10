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
# 	b. chance of getting caught and staff being arrested


class Game

	def initialize
		@cash = 100
		@sellers = 0
		@thiefs = 0
		@police = 0
		@cds = 5
	end


	def make_sale(item, amount)
		if item == 'cds'
			@cds -= amount
			@cash += (amount)*5
		end
	end



	def status
		puts "#{@cash} cash"
	end

end

active_game = Game.new
active_game.status
active_game.make_sale('cds', 2)
active_game.status