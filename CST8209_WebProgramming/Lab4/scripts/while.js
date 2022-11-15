
// second arg : initial value
let choice =  prompt("Enter a number between 0 to 100(Integer)> ", "");
var i = 0; // Index

// Regular Function
// parameter1: verified number
function getNumber(num) {
  while(i < num) {
    document.writeln("value of index is: " + i + "</br>");
    i += 10;
  };
};

// require to user input Integer, 0 <= input <= 100
while (choice < 0 || choice > 100 || !Number.isInteger(Number(choice))) {
  choice =  prompt("Enter a number between 0 to 100(Integer)> ", "");
}
// call a function after verified a argument
getNumber(choice);
