function validateProf() {
  // cancel send form content to the URL
  event.preventDefault();

  // set validation flag
  var validate = true;

  // values
  let fName = profile.fname.value;
  let fNameError = document.querySelector('#fnameError');
  let lName = profile.lname.value;
  let lNameError = document.querySelector('#lnameError');
  let mobile = profile.mobile.value;
  let mobileError = document.querySelector('#mobileError');
  let today = new Date();
  let ddate = new Date(profile.ddate.value);
  let ddateError = document.querySelector('#ddateError');
  let dtime = profile.dtime.value;
  let dtimeError = document.querySelector('#dtimeError');


  // FirstName check min and max length
  if(fName.length < 3) {
    fNameError.textContent = 'Please input more than 3 characters';
    validate = false;
  }else if(fName.length > 15) {
    fNameError.textContent = 'Please input less than 15 characters';
    validate = false;
  }

  // LastName check min and max length
  if(lName.length < 3) {
    lNameError.textContent = 'Please input more than 3 characters';
    validate = false;
  }else if(lName.length > 15) {
    lNameError.textContent = 'Please input less than 15 characters';
    validate = false;
  }


  // mobile/phone check
  // check whether number or not.
  if(!parseInt(mobile)) {
    mobileError.textContent = 'Please input number';
    validate = false;
  } else {
    // check min and max length
    if(mobile.length < 9) {
      mobileError.textContent = 'Please input more than 10 characters';
      validate = false;
    }else if(lName.length > 15) {
      mobileError.textContent = 'Please input less than 15 characters';
      validate = false;
    }
  }

  // check ddate, it should be 3days after today
  if((ddate <= today) || (profile.ddate.value == '')) {
    ddateError.textContent = 'Please input 3 days after today';
    validate = false;
  } else {
    let difInTime = ddate.getTime() - today.getTime();
    let difInDays = difInTime / (1000 * 60 * 60 * 24)
    if(difInDays < 2){
      ddateError.textContent = 'Please input 3 days after today';
      validate = false;
    }
  }

  // check dtime
  if(!dtime) dtimeError.textContent = 'Please input delivery time';


  if(validate) {
    // set data to session strage
    // form data
    let formdata = {
      Fname : profile.fname.value,
      Lname : profile.lname.value,
      Email : profile.email.value,
      Mobile : profile.mobile.value,
      Ddate : profile.ddate.value,
      Dtime : profile.dtime.value,
      Bcall : profile.bcall.value,
      Place : profile.place.value
    }

    // items data
    let itemsarray = [];
    document.querySelectorAll('tr').forEach((item, i) => {
      if(i > 0) {
        itemsarray.push([item.firstChild.childNodes[1].getAttribute('alt'), item.childNodes[2].textContent])
      }
    });
    let backet = {
      Subtotal : document.querySelector('#subtotal').value,
      Items : itemsarray
    }

    sessionStorage.setItem("form", JSON.stringify(formdata));
    sessionStorage.setItem("backet", JSON.stringify(backet));
    // relocate to summary.html
    window.location.href="http://127.0.0.1:8887/summary.html";
  }

}
