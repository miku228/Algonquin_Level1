var th_line = "<tr><th>Item</th><th>Value($)</th><th>Amount</th><th>Subtotal</th></tr>"
// class
class Item {
  constructor(name, value, imgPath, imgRef) {
    this.name = name;
    this.value = value;
    this.imgPath = imgPath;
    this.imgRef = imgRef;
  }

  // method
  displayItems() {
    var img_line = "<tr><td><button type='button' name='minus' class='minus calculate'> - </button><img class='img' src=\' " + this.imgPath + "\' alt=\' " + this.name + " \' ><button type='button' name='plus' class='plus calculate'> + </button></td>";
    var value_line = "<td>" + this.value + "</td>";
    var amount_line = "<td>" + 0 + "</td>";
    var subtotal_line = "<td>" + 0 + "</td></tr>";
    return img_line + value_line + amount_line + subtotal_line;
  }
}


// get json data with AJAX
function populatexml() {
  const httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = function() {
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
      if (httpRequest.status === 200) {
        const data = JSON.parse(httpRequest.responseText);
        let array = setToClass(data);
        setToHTML(array);
        setEvents()
      } else {
        alert('There was a problem with the request.');
      };
    };
  };

  httpRequest.open('GET', '/data.json');
  httpRequest.send();
}


function setToClass(obj){
  // console.log(obj.length);
  var itemsarry = [];
  obj.forEach((item, i) => {
    // name, value, imgPath, imgRef
    let i_name = item['name'];
    let i_value = item['value'];
    let i_imgPath = item['imgPath'];
    let i_imgRef = item['imgRef'];
    let itemclass = new Item(i_name, i_value, i_imgPath, i_imgRef)
    // push to array
    itemsarry.push(itemclass);
  });
  return itemsarry;
}

function setToHTML(array) {
  let inserthtml = th_line;
  array.forEach((item, i) => {
    inserthtml += item.displayItems();
  });

  document.querySelector('table').innerHTML = inserthtml;
}



function setEvents() {
  // set 3 days after from today to ddate placeholder
  let today = new Date();
  let tmonth = '';
  today.getMonth() + 1 < 10 ? tmonth = '0' + (today.getMonth() + 1) : tmonth = (today.getMonth() + 1);
  let ftoday = today.getFullYear() + '-' + (tmonth) + '-' + (today.getDate() + 3);
  document.querySelector('#ddate').placeholder = ftoday;

  // set event to + & - button
  document.querySelectorAll('.calculate').forEach((item, i) => {
    item.addEventListener('click', function(ev) {
      let tr = this.parentNode.parentNode;
      let amount = parseInt(this.parentNode.parentNode.childNodes[2].textContent);
      let subtotal = 0;
      if(this.name == 'plus') {
        amount += 1;
      } else if(this.name == 'minus'){
        if(amount > 0) {
          amount -= 1;
        }
      }
      this.parentNode.parentNode.childNodes[2].textContent = amount;
      subtotal = parseInt(this.parentNode.parentNode.childNodes[1].textContent) * amount;
      this.parentNode.parentNode.childNodes[3].textContent = subtotal;
      calculateSub();
    })
  });

  // set subtotal
  function calculateSub() {
    let subtotal = 0;
    document.querySelectorAll('tr').forEach((item, i) => {
      if(i > 0) {
        subtotal += parseInt(item.childNodes[3].textContent)
      }
    });
    document.querySelector('#subtotal').value = subtotal;
  }

  // set event to submit button
  document.profile.addEventListener('submit', validateProf);

  // set event to reset button
  document.profile.addEventListener('reset', function() {
    // reset form
    document.profile.reset();

    // reset all errors
    // document.querySelector('.alert').textContent = '';
    document.querySelectorAll('.alert').forEach((item, i) => {
      item.textContent = '';
    });


    // reset item table
    document.querySelectorAll('tr').forEach((item, i) => {
      if(i > 0) {
        // amount
        item.childNodes[2].textContent = '0';
        // subtotal
        item.childNodes[3].textContent = '0';
      }
    });
    document.querySelector('#subtotal').value = '0';

  });


}

populatexml();
