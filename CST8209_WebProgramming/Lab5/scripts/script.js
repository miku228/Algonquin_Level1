//midterm JavaScript file

class Book {
  // constructor(attribute)
  constructor(title, author, genre) {
    this.title = title;
    this.author = author;
    this.genre = genre;
  }

  // method
  displayBookInfo() {
    var title_line = "<strong>Title: </strong>" + this.title + "<br>\n";
    var author_line = "<strong>Author: </strong>" + this.author + "<br>\n";
    var genre_line = "<strong>Genre: </strong>" + this.genre + "<hr>\n";
    // return as one string
    return (title_line + author_line + genre_line);
  };

};

//the following serves only as data sample, you can use different books or more than 3
book1 = {
author: "William Shakespeare",
title : "The Tempest",
genre : "Historical Fiction"
};

book2 = {
author: "Stephen King",
title : "The Shining",
genre : "Horror"
};

book3 = {
author: "Anne Frank",
title : "The Diary of Anne Frank",
genre : "Non-Fiction"
};

var bookArray = [];

// get user input and return Book object
function addBook() {
  let title = prompt("Please input a book title > ");
  let author = prompt("Please input a book author > ");
  let genre = prompt("Please input a book genre > ");
  return new Book(title, author, genre);
};

// prompt user to enter a new book information at least three times
// push to bookArray the item user input
var answer = "y"
var count = 0
do {
  alert("please input three books information(title, author, genre). Count : "+ (count+1))
  item = addBook();
  bookArray.push(item);
  count++

  if(count >= 3) {
    answer = prompt("Please input q to quit entering book's information > ")
  }

} while(answer !== "q")

// Display all books in html
bookArray.forEach((item, i) => {
  document.write(item.displayBookInfo());
});
