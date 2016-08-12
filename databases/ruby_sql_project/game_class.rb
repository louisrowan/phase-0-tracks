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
	attr_reader :cash, :day, :level, :sellers, :thieves, :inventory

	def initialize
		@cash = 100
		@sellers = 1
		@thieves = 1
		@police = 0
		@inventory = 5
		@day = 1
		@level = 1
	end


	def daily_sales
		daily_sellers = @sellers
		daily_profit = daily_sellers*@level*20
		@inventory -= daily_sellers
		@cash += daily_profit
		if @inventory <= 0
			return 'ran out of products'
		end
		if @cash > 300
			if @level == 1
				@level = 2
				5.times { puts "-"*50 }
				puts "Congratulations! You have reached level 2"
				puts "You can now sell stolen televisions for double the profit!"
				5.times { puts "-"*50 }
			end
		end
		if @cash > 1000
			if @level == 2
				@level = 3
				5.times { puts "-"*50 }
				puts "Congratulations! You have reached level 3"
				puts "You can now sell stolen computers for even more profit!"
				5.times { puts "-"*50 }
			end
		end

	end

	def daily_thievery
		@inventory += (@thieves)*3
	end


	def advance_day
		@day += 1
		pay_workers
		if daily_sales == 'ran out of products'
			puts "You ran out of things to sell so your workers quit. Game over"
			return 'game over'
		elsif daily_sales == 'reached level 2'
			return 'reached level 2'
		end
		daily_thievery
		daily_consequences
		if game_active? == false
			return 'game over'
		end
		if rand(100) == 0
			puts "You got caught by cops"
			puts "game over"
			return 'game over'
		end
		operations
	end

	def game_active?
		if @cash < 0
			puts "You ran out of money! Game over."
			return false
		end
	end

	def daily_consequences
		@sellers.times do |person|
			random = rand(50)
			if random == 0
				@sellers -= 1
				puts "one of your sellers got arrested! You now have #{@sellers} left!"
			end
		end
		@thieves.times do |person|
			random = rand(50)
			if random == 0
				@thieves -= 1
				puts "one of your thieves got arrested! You now have #{@thieves} left!"
			end
		end
	end

	def operations
		puts
		puts "*"*50
		puts "This is day #{day}, you have $#{@cash} and are in level #{level}."
		puts "You currently employ #{@sellers} sellers, who total $#{@sellers*10}/day"
		puts "You currently employ #{@thieves} thieves, who total $#{@thieves*10}/day"
		puts "You have #{@inventory} inventory in stock."
		puts "*"*50
		puts
	end



	def pay_workers
		@cash -= (@sellers + @thieves)*10
	end

	def hire_seller
		@sellers += 1
	end

	def hire_thief
		@thieves += 1
	end



end