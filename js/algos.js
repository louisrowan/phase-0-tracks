array = ["long phrase", "longest phrase", "longer phrase", "longest phrase ever", "short"]

function longestItem(array) {
	var longest = ''
		for ( var i = 0; i < array.length; i++) {
			if (array[i].length > longest.length)
				longest = array[i]
		}
	return longest
}

console.log(longestItem(array))

console.log(longestItem(["longer", 'short']))

console.log(longestItem(['bananas', 'wine', 'abcdefghijklmnop', '22', 22]))