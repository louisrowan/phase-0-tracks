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
	attr_reader :cash, :day

	def initialize
		@cash = 100
		@sellers = 1
		@thieves = 1
		@police = 0
		@cds = 5
		@day = 1
	end


	def daily_sales
		daily_sellers = @sellers
		daily_profit = daily_sellers*20
		@cds -= daily_sellers
		@cash += daily_profit
		if @cds <= 0
			return 'ran out of products'
		end
	end

	def daily_thievery
		@cds += (@thieves)*3
	end


	def advance_day
		@day += 1
		pay_workers
		if daily_sales == 'ran out of products'
			puts "You ran out of things to sell so your workers quit. Game over"
			return 'game over'
		end
		daily_thievery
		daily_consequences
		if game_active? == false
			return 'game over'
		end
		status
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
		puts "You currently employ #{@sellers} sellers, who make $#{@sellers*10}/day"
		puts "You currently employ #{@thieves} thieves, who make $#{@thieves*10}/day"
		puts "You have #{@cds} cds in stock."
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


	def status
		puts "Day #{@day}: #{@cash} cash, #{@cds} cds, #{@sellers} sellers."
	end

end