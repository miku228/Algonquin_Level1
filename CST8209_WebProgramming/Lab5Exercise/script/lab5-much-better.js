//Define class constructor and methods
class Card {
  constructor(name,email,address,phone){
    this.name = name;
    this.email = email;
    this.address = address;
    this.phone = phone;
  }
  cardDetails() {
    var name_line = "<strong>Name: </strong>" + this.name + "<br>\n";
    var email_line = "<strong>Email: </strong>" + this.email + "<br>\n";
    var address_line = "<strong>Address: </strong>" + this.address + "<br>\n";
    var phone_line = "<strong>Phone: </strong>" + this.phone + "<hr>\n";
    return (name_line + email_line + address_line + phone_line);
  }
}

// Create the objects
var myCardsArray = [];
myCardsArray[0] = new Card("Sue Suthers",
                   "sue@suthers.com",
                   "123 Elm Street, Yourtown ST 99999",
                   "555-555-9876");
myCardsArray[1] = new Card("Fred Fanboy",
                    "fred@fanboy.com",
                    "233 Oak Lane, Sometown ST 99399",
                    "555-555-4444");
myCardsArray[2] = new Card("Jimbo Jones",
                     "jimbo@jones.com",
                     "233 Walnut Circle, Anotherville ST 88999",
                     "555-555-1344");

// wecould have kept the variables sue, fred, jimbo from lab5_better.js and used push to populate the array
// myCardsArray.push(sue);
// myCardsArray.push(fred);
// myCardsArray.push(jimbo);

//Now loop over array and print
// myCardsArray.forEach((card) => {
//   var details = card.cardDetails();
//   document.write(details);
// });

//another way to loop
for(let card of myCardsArray){
  // we can do it in one line instead of 2 as above
  document.write(card.cardDetails());
}
document.querySelector('p').textContent = "A much better way to declare objects";
