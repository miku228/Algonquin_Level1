var minimum = Number(prompt("Enter the minimum value > ", ""));
var maximum = Number(prompt("Enter the maximum value > ", ""));
var increase = Number(prompt("Enter the increse value > ", ""));



// arrow function
var getIndex = (min, max, inc) => {
  for(var i = min; i <= max; i += inc) {
    document.writeln("Value of Index : " + i + "</br>");
  };
};

// call a arrow function
getIndex(minimum, maximum, increase);
