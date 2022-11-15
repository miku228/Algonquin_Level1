// ** Section A **
// ***************
class Dogs {
  // constructor 4 properties and 3 different datatypes(string, int, boolean)
  constructor(name, weight, origin, isCorgi){
    this.name = name;
    this.weight = weight;
    this.origin = origin;
    this.isCorgi = isCorgi;
  }
  // method 1 : make the string to show in the html
  formatInfo(){
    var name_line = "<strong>Name : </strong>" + this.name + "<br>\n";
    var weight_line = "<strong>Weight(lb) : </strong>" + this.weight + "<br>\n";
    var origin_line = "<strong>Origin : </strong>" + this.origin + "<br>\n";
    var isCorgi_line = "<strong>isCorgi: </strong>" + this.isCorgi + "<hr>\n";
    // return as one string
    return (name_line + weight_line + origin_line + isCorgi_line);
  }

  // method 2 : make another constructor which convert from weight(lb)
  convertToKg() {
    this.weightKg = this.weight * 0.45
  }

}

// ** Section B **
// ***************

// create an array of object
var dogsArray = []
dogsArray[0] = new Dogs("Cavachon", 35, "North America", false);
dogsArray[1] = new Dogs("Cardigan Welsh Corgi", 38, "Wales", true);
dogsArray[2] = new Dogs("Pembroke Welsh Corgi", 30, "Wales", true);
dogsArray[3] = new Dogs("Golden Retriver", 75, "Scotland", false);

// display in the browser
function DocumentWrite(array){
  array.forEach((dog) => {
    document.write(dog.formatInfo());
  });
}

DocumentWrite(dogsArray);


// ** Section C **
// ***************

// concat each dog's info and display
function formatFilteredInfo(arr) {
  let dogsString = ""
  arr.forEach((item) => {
    dogsString = dogsString + item.formatInfo();
  });
  return dogsString;
  // document.getElementById("buttonsresults").innerHTML = "";
  // document.getElementById("buttonsresults").innerHTML = dogsString;
}

function sortByWeightAsc() {
  return dogsArray.sort((a,b) => a.weight - b.weight);
  // formatFilteredInfo(dogsArray);
}

function sortByWeightDesc() {
  return dogsArray.sort((a,b) => b.weight - a.weight);
  // formatFilteredInfo(dogsArray);
}

function filterByName(str) {
  return  dogsArray.filter((dog) => {
    let dogName = dog.name.toLowerCase();
    return dogName.match(str)
  })
  // formatFilteredInfo(filterdDogsAr);

}

function sortOrFilter(x) {
  let sortedArray = []
  switch(x) {
    case 0:
      sortedArray = sortByWeightAsc();
      break;
    case 1:
      sortedArray = sortByWeightDesc()
      break;
    case 2:
        // let str = document.getElementById("name").value;
        let searchStr = document.querySelectorAll("input[type=text]")[0].value;
        sortedArray = filterByName(searchStr);
      break;
    }


    document.querySelector('#result').innerHTML = formatFilteredInfo(sortedArray);
}
