# Game: Run a street operation selling illicit goods
# types of goods:
# 1. bootleg CDs
# 2. bootleg movies
# 3. Stolen stereos
# 4. Stolen TVs
# 5. Stolen computers

# types of actions that can be taken:
# Hiring
# people to hire:
# a. Salespeople - sell goods
# b. Thiefs - obtain goods
# Advance one day
# Pay workers
# Get caught by police
# Level up after making enough money


class Game
	attr_reader :cash, :day, :level, :sellers, :thieves, :inventory, :active, :cash_previous

	def initialize
		@cash = 100
		@sellers = 1
		@thieves = 1
		@inventory = 5
		@day = 1
		@level = 1
		@level_multiplier = 1
		@active = true
		@cash_previous = 100
		@product = "CD's"
	end

	# Adds 1 to sellers
	def hire_seller
		@sellers += 1
		puts "*"*50
		puts "You just hired a new seller, you now have #{@sellers} sellers working for you."
		puts "*"*50
	end

	# Adds 1 to thieves
	def hire_thief
		@thieves += 1
		puts "*"*50
		puts "You just hired a new thief, you now have #{@thieves} thieves working for you."
		puts "*"*50
	end


	# Adds 1 to day
	# Saves previous day's cash total
	# Calls pay_workers, daily_salves, daily_thievery, daily_consequences methods
	# Ends game if cash or inventory gets below 0, if a random number 0-99 = 0
	# calls operations method which prints to screen
	def advance_day
		@day += 1
		@cash_previous = @cash
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


	# Neatly prints relevant instance variables to screen 
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
		puts "This is day #{@day}, and you have $#{@cash}."
		puts "Yesterday you made $#{@cash - @cash_previous}."
		puts "You are in level #{@level} and are selling #{@product}."
		puts "You currently employ #{@sellers} sellers, who total $#{@sellers*10}/day"
		puts "You currently employ #{@thieves} thieves, who total $#{@thieves*10}/day"
		puts "You have #{@inventory} #{@product} in stock."
		puts "*"*50
		puts
	end


	# Private methods called by advance_day method
	private	

	# Pays each worker $10 every day
	def pay_workers
		@cash -= (@sellers + @thieves)*10
	end



	# Calculates profit based on number of sellers and current level
	# Each seller sells 1 item from inventory per day
	# New levels and level multiplers reached when cash gets to certain levels
	def daily_sales
		daily_profit = @sellers*@level_multiplier*20
		@inventory -= @sellers
		@cash += daily_profit
		if @cash > 300
			if @level == 1
				@level = 2
				@level_multiplier = 2
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
				@level_multiplier = 4
				5.times { puts "-"*50 }
				puts "Congratulations! You have reached level 3"
				puts "You can now sell stolen Stereos for even more profit!"
				5.times { puts "-"*50 }
				puts "Hit return to continue"
				gets.chomp
			end
		end
		if @cash > 10000
			if @level == 3
				@level = 4
				@level_multiplier = 7
				5.times { puts "-"*50 }
				puts "Congratulations! You have reached level 4"
				puts "You can now sell stolen TVs for even more profit!"
				5.times { puts "-"*50 }
				puts "Hit return to continue"
				gets.chomp
			end
		end
		if @cash > 30000
			if @level == 4
				@level = 5
				@level_multiplier = 10
				5.times { puts "-"*50 }
				puts "Congratulations! You have reached level 5"
				puts "You can now sell stolen Computers for max profit!"
				5.times { puts "-"*50 }
				puts "Hit return to continue"
				gets.chomp
			end
		end


	end

	# Each thief steals 3 items per day
	def daily_thievery
		@inventory += (@thieves)*3
	end

	# 1 in 50 chance that each worker gets arrested
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