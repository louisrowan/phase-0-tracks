array = ["long phrase", "longest phrase", "longer phrase", "longest phrase ever", "short"]

function longestItem(array) {
	var longest = ''
		for ( var i = 0; i < array.length; i++) {
			if (array[i].length > longest.length)
				longest = array[i]
		}
	return longest
}


// console.log(longestItem(array))
// console.log(longestItem(["longer", 'short']))
// console.log(longestItem(['bananas', 'wine', 'abcdefghijklmnop', '22', 22]))


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


// Release 1: Create function that checks if 2 objects have a matching key/value pair

function matchingPair(object1, object2) {
	for (var key in object1)
		for (var second_key in object2) {
			if (key + object1[key] == second_key + object2[second_key]) {return_val = true}
			else {return_val = false}
	}
	return return_val;
}

console.log(matchingPair(my_object, second_object)); // -> true

third_object = {
	location: 'USA',
	year: 1900
}

fourth_object = {
	location: 'China',
	year: 2000
}

console.log(matchingPair(third_object, fourth_object)); // -> false


// Release 2:

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

buildArray(5)
console.log(buildArray(4)) // -> [ 'tehsbg', 'wg', 'gfezy', 'iros' ]
console.log(buildArray(8)) // -> [ 'it', 'cuj', 'krj', 'olbdea', 'saswpxq', 'dn', 'vzf', 'pyjgqkp' ]
console.log(buildArray(3)) // -> [ 'ohcbr', 'dmopp', 'ytpv' ]

// Part 2:

for (var i = 0; i < 10; i++) {
	var x = buildArray(Math.floor(Math.random()*10)+1)
	console.log(x)
	console.log("Longest item in array = " + longestItem(x))
	console.log('')
}