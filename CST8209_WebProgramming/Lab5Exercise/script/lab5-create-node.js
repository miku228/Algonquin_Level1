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

let body = document.querySelector("body");
let cardList = body.appendChild(document.createElement('ul'));

for(let card of myCardsArray){
  let li = document.createElement('li');
  // loop over the attribute of a single card object
  for(const property in card) {
    //create the new nodes
    let strongItem = document.createElement('strong');
    strongItem.textContent = property + ": ";
    let spanItem = document.createElement('span');
    spanItem.textContent = card[property];
    spanItem.style.display = "block";
    li.appendChild(strongItem);
    li.appendChild(spanItem);
  }
  cardList.append(li);
}

document.querySelector('p').textContent = "A much better way to declare objects";
