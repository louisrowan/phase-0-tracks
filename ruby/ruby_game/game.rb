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
word_to_be_guessed = gets.chomp
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