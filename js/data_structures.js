var colors = ['blue', 'brown', 'hot pink', 'raspberry ombre'];

var names = ['michael', 'jay', 'paul', 'seattle slew'];

colors.push('red');
names.push('frank');

var horses = {};

for (var i = 0; i < colors.length; i++){
	var name = names[i];
  var color = colors[i];
	horses[name] = color;
  console.log(horses)
}

console.log("")
console.log(horses);
