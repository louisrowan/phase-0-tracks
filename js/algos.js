// Release 0: Find longest phrase
function longestItem(array) {
	var longest = ''
		for ( var i = 0; i < array.length; i++) {
			if (array[i].length > longest.length)
				longest = array[i]
		}
	return longest
}

// Release 1: Find matching key/value pairs
function matchingPair(object1, object2) {
	for (var key in object1)
		for (var second_key in object2) {
			if (key + object1[key] == second_key + object2[second_key]) {return_val = true}
			else {return_val = false}
	}
	return return_val;
}

// Release 2: Build an array of N strings with 1-10 random characters
function buildArray(integer) {
	array = []
	letters = 'abcdefghijklmnopqrstuvwxyz'
	for (var i = 0; i < integer; i++){
		string = ''
		for (var z = 0; z <= Math.floor(Math.random()*10)+1 ; z++ ) {
			string += (letters[Math.floor(Math.random()*26)])
		}
		array.push(string)
	}
	return array
}


// Data Structures: 

array = ["long phrase", "longest phrase", "longer phrase", "longest phrase ever", "short"]

my_object = {
	name: 'michael',
	age: 21,
	isAPerson: true,
};

second_object = {
	name: 'frank',
	age: 18,
	isAPerson: true,
}

third_object = {
	location: 'USA',
	year: 1900
}

fourth_object = {
	location: 'China',
	year: 2000
}

// Driver Code for Release 0: 
console.log('Release 0:')
console.log(longestItem(array))
console.log(longestItem(["longer", 'short']))
console.log(longestItem(['bananas', 'wine', 'abcdefghijklmnop', '22', 22]))



// Driver Code for Release 1:
console.log('')
console.log('Release 1:')
console.log(matchingPair(my_object, second_object)); // -> true
console.log(matchingPair(third_object, fourth_object)); // -> false


// Driver Code for Release 2:
console.log('')
console.log('Release 2:')
console.log(buildArray(4)) // -> [ 'tehsbg', 'wg', 'gfezy', 'iros' ]
console.log(buildArray(8)) // -> [ 'it', 'cuj', 'krj', 'olbdea', 'saswpxq', 'dn', 'vzf', 'pyjgqkp' ]
console.log(buildArray(3)) // -> [ 'ohcbr', 'dmopp', 'ytpv' ]
console.log('')
console.log('Part 2:')

// Part 2:
for (var i = 0; i < 10; i++) {
	var randInteger = buildArray(Math.floor(Math.random()*10)+1)
	console.log("Array # " + (i + 1) + " = ", randInteger)
	console.log("Longest item in array #" + (i + 1) + " = " + longestItem(randInteger))
	console.log('')
}