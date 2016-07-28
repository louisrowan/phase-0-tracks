=begin
	
Input: word or phrase to be guessed

Guess method:
-- input is a character to be guessed
-- guess method checks to see if that character is in the word to be guessed

Hint method:
-- input is the last character guessed
-- outputs a hint showing only the previously guessed characters

=end

class Game

	def initialize(answer)
		@already_guessed = []
		@answer = answer
		@guesses_left = answer.length
		@hint = answer.split('')
	end

	def guess(guess)
		@guess = guess
		update_already_guessed(@guess)
		puts update_hint
		return @guess
	end

	def update_already_guessed(guess)
		@already_guessed.push(guess)
		return @already_guessed
	end

	def update_hint
		@updated_hint = []
		@hint.each do |character|
			if @already_guessed.include?(character)
				@updated_hint.push(character)
			else
				@updated_hint.push(" _ ")
			end
		end
		return @updated_hint.join('')
	end
end

x = Game.new("bananas")
x.guess("c")
x.guess("a")