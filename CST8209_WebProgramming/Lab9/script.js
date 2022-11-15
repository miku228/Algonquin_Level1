
function populatexml() {
  const httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = function() {
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
      // Everything is good, the response was received.
      if (httpRequest.status === 200) {
        const data = JSON.parse(httpRequest.responseText);
        populateHeader(data);
        populateHeroes(data);
      } else {
        // There was a problem with the request.
        alert('There was a problem with the request.');
      };

    } else {
        // Not ready yet.
    };
  };

  httpRequest.open('GET', '/Lab9/data.json');
  httpRequest.send();
}


async function populate() {

  const requestURL = '/Lab9/data.json';
  const request = new Request(requestURL);

  const response = await fetch(request);
  const datas = await response.json();

  populateHeader(datas);
  populateHeroes(datas);

}




// function
function populateHeader(obj) {
  const header = document.querySelector('header');
  const myH1 = document.createElement('h1');
  myH1.textContent = obj['squadName'];
  header.appendChild(myH1);

  const myPara = document.createElement('p');
  myPara.textContent = `Hometown: ${obj['homeTown']} // Formed: ${obj['formed']}`;
  header.appendChild(myPara);
}

function populateHeroes(obj) {
  const section = document.querySelector('section');
  const cities = obj['cities'];

  for (const city of cities) {
    const myArticle = document.createElement('article');
    const myH2 = document.createElement('h2');
    const myPara1 = document.createElement('p');
    const myPara2 = document.createElement('p');
    const myPara3 = document.createElement('p');
    const myList = document.createElement('ul');

    myH2.textContent = city.name;
    myPara1.textContent = `State: ${city.state}`;
    myPara2.textContent = `YearofVisit: ${city.year}`;
    myPara3.textContent = 'Info:';

    const info = city.info;
    for (const inf of info) {
      const listItem = document.createElement('li');
      listItem.textContent = inf;
      myList.appendChild(listItem);
    }

    myArticle.appendChild(myH2);
    myArticle.appendChild(myPara1);
    myArticle.appendChild(myPara2);
    myArticle.appendChild(myPara3);
    myArticle.appendChild(myList);

    section.appendChild(myArticle);
  }
}

// execute function
// populate()
populatexml()
