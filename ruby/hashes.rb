# First step is to prompt the user for data
# Convert age and # of children into integers
# Make the true/false question case insensitive

puts "Enter the client's name"
name = gets.chomp
puts "Enter the client's age"
age = gets.chomp.to_i
puts "Enter the number of children"
children = gets.chomp.to_i
puts "Enter the decor theme"
decor_theme = gets.chomp
puts "Pets? True or False"
pets = gets.chomp
if pets.downcase == 'true' || pets.downcase == 't'
	pets = true
else
	pets = false
end

# Create the hash, input the data taken from the user into the corresponding values

Details = {
	name: name,
	age: age,
	children: children,
	decor_theme: decor_theme,
	pets: pets,
}

print Details

# Ask if there is a value to be updated

puts
puts
puts "To update a value, enter either 'name', 'age', 'children', 'decor_theme' or 'pets'"
puts "Enter 'none' to skip"
update = gets.chomp

# If there is a value to be updated, user can enter the new value here
# update the key and value on the existing hash with the new info
# convert the inputted key from a string to a symbol so that it replaces the previous one
# If the new value is going to be an integer, convert it to one

if update != 'none'
	puts "Enter the new corresponding value"
	new_val = gets.chomp
	if update == 'age' || update == 'children'
		Details[update.to_sym] = new_val.to_i
	else
		Details[update.to_sym] = new_val
	end
end

puts
print Details