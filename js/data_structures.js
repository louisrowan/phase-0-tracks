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


// Release 2:

function Car(make, year, runsWell) {
	this.make = make;
  this.year = year;
  this.runsWell = runsWell;
  this.starts = function() { console.log("*Revs Engine*");};
  console.log("Car initialization complete");
}

var newCar = new Car("Toyota", 2012, true);
console.log(newCar);
newCar.starts();

var anotherCar = new Car("Mazda", 1990, true);
console.log(anotherCar);
anotherCar.starts();

// If you wanted to loop through the keys and values of an object, how would you do that? (There are a few ways to accomplish this, and some gotchas that can happen depending on your approach.)
// Are there advantages to using constructor functions to create objects? Disadvantages? 