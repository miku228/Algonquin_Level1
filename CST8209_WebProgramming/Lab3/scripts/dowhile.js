var secret = 8;
var guess = 0;

do {

  guess = prompt("Guess a number between 1 to 10 >", "");

} while(secret != guess);

document.writeln("Congratulation! You're guess is correct. </br>");
