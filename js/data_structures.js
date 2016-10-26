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