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


function keyValuePair(object1, object2) {
	for (object1)
		console.log(object1.name)
}

hash1 = {
	name: 'Michael', age: 25, isHuman: true
}

hash2 = {
	name: 'Amanda', age: 30, isHuman: true
}

keyValuePair(hash1, hash2)