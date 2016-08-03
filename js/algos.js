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



for (var key in my_object) {
	console.log(key + " = " + my_object[key])
}

console.log('')

for (var key in second_object) {
	console.log(key + " = " + second_object[key])
}

console.log('')

for (var key in my_object) {
	for (var second_key in second_object) {
		if ( key, my_object[key] == second_key, second_object[key] ){ true }
		else {false}
	}
}