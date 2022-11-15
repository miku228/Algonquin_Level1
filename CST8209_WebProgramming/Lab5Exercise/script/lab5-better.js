// define the functions
function printCardDetails() {
   var name_line = "<strong>Name: </strong>" + this.name + "<br>\n";
   var email_line = "<strong>Email: </strong>" + this.email + "<br>\n";
   var address_line = "<strong>Address: </strong>" + this.address + "<br>\n";
   var phone_line = "<strong>Phone: </strong>" + this.phone + "<hr>\n";
   document.write(name_line, email_line, address_line, phone_line);
}

function Card(name,email,address,phone) {
   this.name = name;
   this.email = email;
   this.address = address;
   this.phone = phone;
   this.printCardDetails = printCardDetails;
}

// Create the objects
var sue = new Card("Sue Suthers",
                   "sue@suthers.com",
                   "123 Elm Street, Yourtown ST 99999",
                   "555-555-9876");
var fred = new Card("Fred Fanboy",
                    "fred@fanboy.com",
                    "233 Oak Lane, Sometown ST 99399",
                    "555-555-4444");
var jimbo = new Card("Jimbo Jones",
                     "jimbo@jones.com",
                     "233 Walnut Circle, Anotherville ST 88999",
                     "555-555-1344");

// Now print them
sue.printCardDetails();
fred.printCardDetails();
jimbo.printCardDetails();
document.querySelector('p').textContent = "A better way to declare objects";
