function getSessiondata() {
  var formdata = JSON.parse(sessionStorage.getItem('form'));
  var backet = JSON.parse(sessionStorage.getItem('backet'));

  // set to HTML about formdata
  var fkeys = Object.keys(formdata);
  var fsection = document.querySelector('.formdata');
  var ul = document.createElement('ul');
  // set item to li list
  fkeys.forEach((item, i) => {
    var li = document.createElement('li');
    if(item == 'Bcall') {
      let bcall = '';
      formdata.Bcall ? bcall = 'need call before arraival' : bcall = 'no need call before arraival'
      li.appendChild(document.createTextNode(bcall));
    }else if(item == 'Place') {
      let place = '';
      if(formdata.Place == 'fdoor'){
        place = 'by the front door';
      } else if(formdata.Place == 'bdoor') {
        place = 'by the back door';
      } else if(formdata.Place == 'gdoor') {
        place = 'by the garage door';
      }
      li.appendChild(document.createTextNode(place));
    } else{
      let val = formdata[item];
      li.appendChild(document.createTextNode(val));
    }
  ul.appendChild(li);
  });
  fsection.appendChild(ul);

  // set to HTML about backet item
  var bkeys = Object.keys(backet);
  var bsection = document.querySelector('.backetdata');
  var ol = document.createElement('ol');

  bkeys.forEach((it, i) => {
    var bli = document.createElement('li');
    if(it == 'Subtotal') {
      let valu = backet[it];
      bli.appendChild(document.createTextNode('Subtotal :' + valu));
      ol.appendChild(bli);
    } else {
      backet[it].forEach((array, i) => {
        var bali = document.createElement('li');
        bali.appendChild(document.createTextNode(array[1] + ' ' + array[0] ))
        ol.appendChild(bali);
      });
    }

    console.log(it + ':' + ol)
  });
  bsection.appendChild(ol);

  // clear all session strage
  sessionStorage.clear();
}


getSessiondata()
