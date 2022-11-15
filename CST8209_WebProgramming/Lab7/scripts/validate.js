//validate module
function validateProfile(event) {
  var validre = true;
  // cancel send form content to the URL
  event.preventDefault();

  // Section B-2a : check the firstName element value
  if(profile.firstName.value === '') {
    document.querySelector('#fNameError').textContent = 'Please input First Name.'
    validre = false;
  }else{
    // Section B-2i : add own validation condition
    let firstNamear = profile.firstName.value.split('');
    includeNum = firstNamear.filter(char => !isNaN(char));
    if(includeNum.length > 0) {
      document.querySelector('#fNameError').textContent = 'Please input only String.'
      validre = false;
    }
  }

  // Section B-2b : check the lastName element value
  if(profile.lastName.value  === '') {
    document.querySelector('#lNameError').textContent = 'Please input Last Name.'
    validre = false;
  }

  // Section B-2c : check the address1 element value
  if(profile.address1.value  === '') {
    document.querySelector('#address1Error').textContent = 'Please input address1.'
    validre = false;
  }

  // Section B-2d : check the city element value
  if(profile.city.value  === '') {
    document.querySelector('#cityError').textContent = 'Please input city.'
    validre = false;
  }

  // Section B-2e : check the province element value
  if(profile.province.value  === '') {
    document.querySelector('#provinceError').textContent = 'Please select province.'
    validre = false;
  }

  // Section B-2f : check the country element value
  if(profile.country.value  === '') {
    document.querySelector('#countryError').textContent = 'Please select country.'
    validre = false;
  }

  // Section B-2h
  if(validre) alert('Thank you')

  // Section B-2g
  return validre;


}
