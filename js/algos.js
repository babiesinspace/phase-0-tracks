//PSEUDOCODE: 

//Write a function which takes an array and returns the longest phrase

//Loop through the array and map it

//So that it takes each element and finds it's length

//And returns an array of arrays (string-length, string)

//Sort your new array

//Return the last value's 1 index (this will be the string)

function longest(array) {
var longestWord = " ";
for (var x = 0; x < array.length; x++) {
  if (array[x].length > longestWord.length ) {
    longestWord = array[x];
}
}
console.log(longestWord);}

// Write a function that takes two objects and checks if they share any 
// key-value pairs

// Takes in two objects

// Iterate through one object, to see if any of its pairs are included in the other
// Return true/false 

function matchedPairs(oneObject, twoObject) {
  var compare1 = [];
  var compare2 = [];
  var matched = [];
  
  for (var prop in oneObject && twoObject) {
    compare1.push(prop + " = " + oneObject[prop]);
    compare2.push(prop + " = " + twoObject[prop]);
  }
  
  for (var x = 0; x < compare2.length; x++) {
    if (compare1.includes(compare2[x])){
    matched.push(compare2[x]);
    }
  }
  if (matched.length === 0){
    return false;}
  else {
    console.log("matched pairs: " + matched);
    return true;}
}

 
// Write a function which generates an array of random words 
// btw 1-10 letters

// Input an integer, write a while statement which works that many times

// Each time, create a new random word and feed it into an empty array

// The word may be between 1 - 10 letters

function createArray(fedNumb){
  var randArray = [];
  while (fedNumb > randArray.length) {
    var numOfChars = Math.floor((Math.random() * 10) + 1);
    var text = "";
    while (numOfChars > text.length) {
      var alphabet = "abcdefghijklmnopqrstuvwxyz"
      text += alphabet.charAt(Math.floor(Math.random() * alphabet.length));
    }
    randArray.push(text)}
  return randArray;
}


// DRIVER CODE:

var animals = ["Lions", "Tigers", "Bears", "Hippopotamus", "Wolves"];

var colors = ["Black", "Teal", "Purple", "Magenta", "Aquamarine", "Smaragdine"]

var words = ["Below", "Heart", "Learning", "Coding", "Medium"];

var obj2 = { foo: "bar", baz: 42, tree: "house" };

var obj1 = { foo: "bar", baz: 42 }; 

var thing1 = { animal: "cracker", two: "boots", all: 3, never: 987 };

var thing2 = {two: "boots", all: 3, never: 987, total: "recall"};

longest(words);
longest(animals);
longest(colors);
matchedPairs(thing2,thing1);
matchedPairs(obj1, obj2);
matchedPairs(obj1, thing2);
createArray(6);

//Add driver code that does the following 10 times: 
// generates an array, prints the array, feeds the 
// array to your "longest word" function, and prints the result.

var i = 0;
do {
  i += 1;
  var feeder = createArray(Math.floor((Math.random() * 10) + 1));
  console.log("The array we are comparing is: " + feeder);
  console.log("The longest word is...");
  longest(feeder);
} while (i < 10);

