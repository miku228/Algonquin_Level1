var secret = 8;
var guess = 0;

// anonymous function
var guess_func = function(guess){
  do {

    var guess_num = prompt("Guess a number between 1 to 10(Integer) >", "");

  } while(secret != guess_num);

};

// call a anonymous function
guess_func(guess);

document.writeln("Congratulation! You're guess is correct. </br>");
