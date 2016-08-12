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
	attr_reader :cash, :day, :level, :sellers, :thieves, :inventory, :active

	def initialize
		@cash = 100
		@sellers = 1
		@thieves = 1
		@inventory = 5
		@day = 1
		@level = 1
		@active = true
		@product = "CD's"
	end

	def hire_seller
		@sellers += 1
		puts "*"*50
		puts "You just hired a new seller, you now have #{@sellers} sellers working for you."
		puts "*"*50
	end

	def hire_thief
		@thieves += 1
		puts "*"*50
		puts "You just hired a new thief, you now have #{@thieves} thieves working for you."
		puts "*"*50
	end


	def advance_day
		@day += 1
		pay_workers
		daily_sales
		daily_thievery
		daily_consequences
		if @cash <= 0
			puts "*"*50
			puts "You ran out of money. Game over."
			@active = false
			return
		elsif @inventory <= 0
			puts "*"*50
			puts "You ran out of inventory. Game over."
			@active = false
			return
		elsif rand(100) == 0
			puts "*"*50
			puts "You got caught by cops. Game over."
			@active = false
			return
		end
		operations
	end


	def operations

		if @level == 1
			@product = "CDs"
		elsif @level == 2
			@product = "Movies"
		elsif @level == 3
			@product = "Stereos"
		elsif @level == 4
			@product = "TVs"
		elsif @level == 5
			@product = "Computers"
		end


		puts
		puts "*"*50
		puts "This is day #{day}, and you have $#{@cash}."
		puts "You are in level #{@level} and are selling #{@product}."
		puts "You currently employ #{@sellers} sellers, who total $#{@sellers*10}/day"
		puts "You currently employ #{@thieves} thieves, who total $#{@thieves*10}/day"
		puts "You have #{@inventory} #{@product} in stock."
		puts "*"*50
		puts
	end


	# Private methods called by advance_day method
	private	

	def pay_workers
		@cash -= (@sellers + @thieves)*10
	end


	def daily_sales
		daily_sellers = @sellers
		daily_profit = daily_sellers*@level*20
		@inventory -= daily_sellers
		@cash += daily_profit
		if @cash > 300
			if @level == 1
				@level = 2
				5.times { puts "-"*50 }
				puts "Congratulations! You have reached level 2"
				puts "You can now sell stolen Movies for double the profit!"
				5.times { puts "-"*50 }
				puts "Hit return to continue"
				gets.chomp
			end
		end
		if @cash > 1000
			if @level == 2
				@level = 3
				5.times { puts "-"*50 }
				puts "Congratulations! You have reached level 3"
				puts "You can now sell stolen Stereos for even more profit!"
				5.times { puts "-"*50 }
				puts "Hit return to continue"
				gets.chomp
			end
		end
		if @cash > 5000
			if @level == 3
				@level = 4
				5.times { puts "-"*50 }
				puts "Congratulations! You have reached level 4"
				puts "You can now sell stolen TVs for even more profit!"
				5.times { puts "-"*50 }
				puts "Hit return to continue"
				gets.chomp
			end
		end
		if @cash > 10000
			if @level == 4
				@level = 5
				5.times { puts "-"*50 }
				puts "Congratulations! You have reached level 5"
				puts "You can now sell stolen Computers for even more profit!"
				5.times { puts "-"*50 }
				puts "Hit return to continue"
				gets.chomp
			end
		end


	end

	def daily_thievery
		@inventory += (@thieves)*3
	end

	def daily_consequences
		@sellers.times do |person|
			random = rand(50)
			if random == 0
				@sellers -= 1
				puts "*"*50
				puts "one of your sellers got arrested! You now have #{@sellers} left!"
				puts "*"*50
			end
		end
		@thieves.times do |person|
			random = rand(50)
			if random == 0
				@thieves -= 1
				puts "*"*50
				puts "one of your thieves got arrested! You now have #{@thieves} left!"
				puts "*"*50
			end
		end
	end

	




end