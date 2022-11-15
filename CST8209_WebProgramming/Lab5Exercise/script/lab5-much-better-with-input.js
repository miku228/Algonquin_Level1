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

function inputCard(){
  let name = prompt ('Plz, enter the name');
  let email = prompt ('Plz, enter the email');
  let address = prompt ('Plz, enter the address');
  let phone = prompt ('Plz, enter the phone');
  return new Card(name, email, address, phone);
}
// Create the objects by asking user to input, q to quit
var myCardsArray = [];
while (true){
  let c = inputCard();
  myCardsArray.push(c);
  var quit = prompt ('Plz, enter q to quit entering card dtails');
  if (quit==='q')
    break;
}

for(let card of myCardsArray){
  document.write(card.cardDetails());
}
document.querySelector('p').textContent = "A much better way to declare objects with user input";
