# Swap first and last name
# Change all vowels to next vowel
# Change all consonants to next consonant
# 1. Create vowel array and consonant array
# 2. Turn name into array, loop through array and for each
# character, determine if it is a vowel or consonant
# 3. Depending on what type it is, use .next

def alias_method (name)
	new_first = []
	new_last = []
	vowels_string = "aeiou"
	vowels = vowels_string.split('')
	consonants_string = "bcdfghjklmnpqrstvwxyz"
	consonants = consonants_string.split('')
	two_names = name.split(' ')
	first_name = two_names[0].split('')
	last_name = two_names[1].split('')
	last_name.each do |character|
		character = character.downcase
		if vowels.include?(character)
			index = vowels.index(character)
			new_last.push(vowels[index + 1])
		end
		if consonants.include?(character)
			index = consonants.index(character)
			new_last.push(consonants[index + 1])
		end
		if character.downcase == 'z'
			new_last.push('b')
		end
		if character.downcase == 'u'
			new_last.push('a')
		end
	end
	first_name.each do |character|
		character = character.downcase
		if vowels.include?(character)
			index = vowels.index(character)
			new_first.push(vowels[index + 1])
		end
		if consonants.include?(character)
			index = consonants.index(character)
			new_first.push(consonants[index + 1])
		end
		if character.downcase == 'z'
			new_first.push('b')
		end
		if character.downcase == 'u'
			new_first.push('a')
		end
	end
	new_last.push(' ')
	new_last = new_last.join('').capitalize
	new_first = new_first.join('').capitalize
	return_val = new_last + new_first
	return_val
end

loop do
	puts "Enter a name to be converted into a new alias or 'quit' to exit"
	user_response = gets.chomp
	if user_response == 'quit' || user_response == ''
		break
	end
	if user_response.split(' ').length != 2
		puts "Please enter a valid reponse with both a first and last name"
		puts
		next
	end
	puts "Alias: #{alias_method(user_response)}"
	puts
end