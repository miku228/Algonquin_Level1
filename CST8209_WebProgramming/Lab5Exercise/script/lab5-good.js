
// define the functions
function printCard(card) {
   var nameLine = "<strong>Name: </strong>" + card.name + "<br>\n";
   var emailLine = "<strong>Email: </strong>" + card.email + "<br>\n";
   var addressLine = "<strong>Address: </strong>" + card.address + "<br>\n";
   var phoneLine = "<strong>Phone: </strong>" + card.phone + "<hr>\n";
   document.write(nameLine, emailLine, addressLine, phoneLine);
}

// Create the objects
var card1 = {
  name: "Sue Suthers",
  email: "sue@suthers.com",
  address: "123 Elm Street, Yourtown ST 99999",
  phone: "555-555-9876"
}

var card2 = {
  name: "Fred Fanboy",
  email: "fred@fanboy.com",
  address: "233 Oak Lane, Sometown ST 99399",
  phone: "555-555-4444"
}

var card3 = {
  name: "Jimbo Jones",
  email: "sue@suthers.com",
  address: "233 Walnut Circle, Anotherville ST 88999",
  phone: "555-555-1344"
}

// Now print them
printCard(card1);
printCard(card2);
printCard(card3);
document.querySelector('p').textContent = "Not the best way to declare objects of same class type";
