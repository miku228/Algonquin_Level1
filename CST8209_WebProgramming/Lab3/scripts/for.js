var minimum = Number(prompt("Enter the minimum value > ", ""));
var maximum = Number(prompt("Enter the maximum value > ", ""));
var increase = Number(prompt("Enter the increse value > ", ""));


for(var i = minimum; i <= maximum; i += increase) {
  document.writeln("Value of Index : " + i + "</br>");
};
