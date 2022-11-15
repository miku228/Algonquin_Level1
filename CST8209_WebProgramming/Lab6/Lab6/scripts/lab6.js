//Lab6 - Working with the Document Object Modelle

let mainTitle = document.querySelector('#mainTitle');
// add the text to the element with id = "mainTitle"
mainTitle.textContent = "Learning about the Document Object Model";

// add attribute to the element with id = "mainTitle"
mainTitle.setAttribute('align', 'center');

// change the title attribute on the imag tag
let img1 = document.querySelector('#image1');
img1.setAttribute('title', 'JavaScript 1');

// add the attribute to right align the element with id='image1'
img1.setAttribute('align', 'right');

// append the text as a list item
// get ul node
let ullist = document.querySelector('#list');
// make new node for second li item
let newsecondli = document.createElement('li');
newsecondli.appendChild(document.createTextNode("August 1996"));
ullist.insertBefore(newsecondli, ullist.children[1]);

// append the text as the last item of the list
let newlastli = document.createElement('li');
newlastli.appendChild(document.createTextNode("1.8.2 June 22, 2009"));
ullist.insertBefore(newlastli, ullist.lastElementChild.nextSibling);

// change the list item it contains the text 1.6 November 99999
// find item using for loop then check the textContent then change it
for (var i = 0; i < ullist.children.length; i++) {
  if(ullist.children[i].textContent == "1.6 November 9999"){
    ullist.children[i].textContent = "1.6 November 2005";
  };
};


document.write("The number of li tag : " + document.querySelectorAll('li').length)
