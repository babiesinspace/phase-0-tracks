// Write a function which reverses and returns a string:
// Take a string as input

function reverse(stringIn){
  var reverse = "Your reversed string is: ";
  // Starting from the last character to the first, create reversed string
  for (var y = (stringIn.length - 1); y >= 0; y--) {
  reverse += stringIn[y];} // Store this function under a variable name
  return reverse;
}

// Print the variable using a simple conditional == true statement

if (0 === 0) {
console.log(reverse("Reverse Me!!!"));
}
