var colors = ["blue", "green", "purple", "black"];
var names = ["Ed", "Cash", "Buttercup", "Kevin"];

colors.push("Topaz");
names.push("Herbierto");

console.log(colors);
console.log(names);

var horsesOfColor = {};

for (var i = 0; i < colors.length; i++) {
  horsesOfColor[names[i]] = colors[i];
}

console.log(horsesOfColor);

function Car(make, color, leatherInterior, tiresIncluded) {
  this.make = make;
  this.color = color;
  this.leatherInterior = leatherInterior;
  this.tiresIncluded = tiresIncluded;

  this.carBeep = function() { console.log( "*beep!*"); };

}

console.log("Make a car FOR ALLIE (NOT Kevin)...");
var brandNEWCar = new Car("Rabbit-Conv.", "black", true, 5);
console.log(brandNEWCar);
console.log("My car can beep!!!: ");
brandNEWCar.carBeep();
console.log("-----");
console.log("Make a car for Kevin...")
var brandNEWCar = new Car("Gremlin-Geo", "pink", false, 4);
console.log(brandNEWCar);
console.log("His car -kinda- beeps! :");
console.log("feebly") + brandNEWCar.carBeep();



