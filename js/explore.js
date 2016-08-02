// Pseudocode a function that takes a string as a parameter and reverses the string
// Step 1: Input a string into the function as a parameter
// Step 2: Iterate through the string starting with the last character, moving forward
// Step 3: Add each character to a new string
// Step 4: Print out the new string. This should be the original string, but reversed.

function reverseString(string) {
	var newString = ''
		for (var i = string.length - 1; i >= 0; i--) {
			newString += string[i];
			}
	return newString
}

reverseString("racecar") // -> 'racecar'
reverseString("hello") // -> 'olleh'

// Stored inside a variable:
var reversedString = reverseString("firestation")
// console.log(reversedString) -> noitatserif

// Prints variable if length is greater than 5:
if (reversedString.length > 5) {
	console.log(reversedString)
}
