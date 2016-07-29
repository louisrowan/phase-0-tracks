=begin
	
Initialize:
-- input is the word to be guessed
-- declare instance variables like an empty array of already guessed letters
-- determine how many guesses the player will have

Guess method:
-- input is a character to be guessed
-- checks to see if that letter has already been guessed
-- if not, calls already_guessed method to add it to list of guessed letters
-- calls hint method
-- subtracts 1 from guesses left variable each time a new guess is called
-- returns 'you win', 'already guessed' or 'you ran out of guesses', when appropriate

Hint method:
-- iterates through answer and determines which letters have been guessed
-- outputs a hint showing only the previously guessed characters
-- un-guessed characters are shown as " _ "

update_already_guessed method:
-- contains an array of all past and current guesses

=end

class Game

	def initialize(answer)
		@already_guessed = []
		@answer = answer
		@guesses_left = answer.length + 2
		@hint = answer.split('')
	end

	def guess(guess)
		@guess = guess
		if @already_guessed.include?(@guess)
			return 'already guessed'
		end
		update_already_guessed(@guess)
		if update_hint == 'you win' || @guess == @answer
			puts "-"*50
			puts "You win! You correctly guessed the word: #{@answer}"
			return 'you win'
		end
		puts "Hint: #{update_hint}"
		@guesses_left -= 1
		if @guesses_left == 0
			puts "You ran out of guesses! Better luck next time."
			puts "The word was #{@answer}"
			return 'game over'
		end
		puts "#{@guesses_left} guesses left"
		return @guess
	end

	def update_already_guessed(guess)
		@already_guessed.push(guess)
		return @already_guessed
	end

	def update_hint
		updated_hint = []
		@hint.each do |character|
			if @already_guessed.include?(character) || character == ' '
				updated_hint.push(character)
			else
				updated_hint.push(" _ ")
			end
		end
		if updated_hint.join('') == @answer
			return 'you win'
		end
		return updated_hint.join('')
	end
end


# User Interface
puts 'Enter a word to be guessed'
word_to_be_guessed = gets.chomp.downcase
50.times do
	puts "*"*50 #-> this code is just to clear the screen of the word to be guessed
end
puts
puts "You have #{word_to_be_guessed.length + 2} attempts to guess the word or phrase:"
x = Game.new(word_to_be_guessed)
puts x.update_hint
puts
loop do
	puts 'Guess a single letter or the entire word/phrase'
	response = gets.chomp
	output = x.guess(response)
	if output == 'game over'
		break
	elsif output == 'already guessed'
		puts "Already guessed, try a new letter"
	elsif output == 'you win'
		break
	end
	puts
end