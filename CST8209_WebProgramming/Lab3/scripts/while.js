
// second arg : initial value
let choice =  prompt("Enter a number between 0 to 100> ", "");
var i = 0; // Index
//  check between 0 to 100
if(choice >= 0 && choice <= 100) {
  while(i < choice) {
    document.writeln("value of index is: " + i + "</br>");
    i += 10;
  };

} else {
  document.writeln("this is not the number between 0 to 100</br>");
}
