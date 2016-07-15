# Cycle through the characters in a string
# Create an empty string
# For each character, add the next sequential character to the empty string
# If the character is 'z', add 'a'
# Return the new string

def encrypt string
  var = 0
  x = ''
  while var < string.length
    new_letter = string[var]
    if new_letter == 'z'
    	x = x + 'a'
    else
    	x = x + (new_letter.next)
    end
    var += 1
  end
  return x
end

# encrypt("abc") = "bcd"
# encrypt("zed") = "afe"

# Cycle through the characters in a string
# Create an empty string
# Create a string that contains the alphabet
# For each letter in the string, find its index in the alphabet
# Subtract 1 from that index to find the index of the previous character
# Add this new character to the empty string
# Return the new string

def decrypt string
  var = 0
  x = ''
  while var < string.length
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    letter = string[var]
    z = alphabet.index(letter)
    new = z-1
    x = x + alphabet[new]
    var += 1
  end
  return x
end

# decrypt(encrypt("swordfish")) = swordfish
# It works because the encrypt program returns the string with
# all characters advanced one letter.
# But then the decrypt program moves them back one letter.




answer = nil
until answer == 'e' || answer == 'd'
	puts "Enter 'd' to decrypt your password or 'e' to encrypt it"
	answer = gets.chomp
	if answer == 'd'
	  decrypt = true
	else answer == 'e'
	  decrypt = false
	end
end

puts "Enter your password"
password = gets.chomp
if decrypt == true
  print decrypt(password)
else
  print encrypt(password)
end