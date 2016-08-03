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