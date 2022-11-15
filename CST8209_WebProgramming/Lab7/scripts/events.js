//form element events
function clearForm() {
  let inputs = document.querySelectorAll('input');
  for(let input of inputs) {
    if(input.type === 'text') input.value = ''
  }

  let selects = document.querySelectorAll('select');
  for(let select of selects) {
    select.value = ''
  }

  let warnings = document.querySelectorAll('span');
  for(let warning of warnings) {
    warning.textContent = '';
  }
}


// Section C-1 : clear the warning mesasge when the firstName is enterd
document.querySelector('#fName').addEventListener('input', function(e) {
  document.querySelector('#fNameError').textContent = ''
})

// Section C-2 : clear the warning mesasge when the lastName is enterd
document.querySelector('#lName').addEventListener('input', function(e) {
  document.querySelector('#lNameError').textContent = ''
})

// Section C-3 : clear the warning mesasge when the address1 is enterd
document.querySelector('#address1').addEventListener('input', function(e) {
  document.querySelector('#address1Error').textContent = ''
})

// Section C-4 : clear the warning mesasge when the city is enterd
document.querySelector('#city').addEventListener('input', function(e) {
  document.querySelector('#cityError').textContent = ''
})

// Section C-5 : clear the warning mesasge when the province is selected
document.querySelector('#province').addEventListener('click', function(e) {
  document.querySelector('#provinceError').textContent = ''
})

// Section C-1 : clear the warning mesasge when the country is selected
document.querySelector('#country').addEventListener('click', function(e) {
  document.querySelector('#countryError').textContent = ''
})


// Section D : show the warning mesasge
// when the form submit with several empty item
document.profile.addEventListener('submit', validateProfile);


// clear all values in form when reset button is clicked
document.profile.addEventListener('reset', clearForm())
