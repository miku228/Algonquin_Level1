// when form is submitted execute validate function
$('form').submit(function(event){
    validre = true;
    // cancel send form content to the URL
    event.preventDefault();
    // clear alerts first
    $('.alert').text('');


    // CatsName is required
    if($('#CatsName').val()==='') {
        $('#cNameError').text('Please input First Name.');
        validre = false;
    }
    
    // check Arrival time and Leave time
    let arTime = $("input[name=atimetxt]").val().slice(0,2) + $("input[name=atimetxt]").val().slice(3,5)
    let leTime = $("input[name=ltimetxt]").val().slice(0,2) + $("input[name=atimetxt]").val().slice(3,5)
    if(arTime > leTime) {
        $('#atimeError').text('Please select eariler time than the Time Leave .');
        $('#ltimeError').text('Please select later time than the Time Arrive .');
        validre = false;
    }

    // Describe Diet txt cannot be empty when special diet is checked
    if($('#sdiet:checked').length > 0){
        console.log(this)
        if($('#ddescribe').val()==='') {
            $('#ddescribeError').text('Please describe diet.');
            validre = false; 
        }
    }

    // Describe Territorial txt cannot be empty when territorial is checked
    if($('#terrirotial:checked').length > 0){
        if($('#dterritorial').val()==='') {
            $('#dterritorialError').text('Please describe territorial.');
            validre = false; 
        }
    }

    // Owner's name is required
    if($('#ownersname').val()==='') {
        $('#oNameError').text("Please input First Owner's Name.");
        validre = false;
    }   

    // Either daytime or cell phone is required
    // both should be 10-digit number
    let daytimephone = $('#daytimephone').val();
    let cellphone = $('#cellphone').val();
    if((daytimephone ==='') && (cellphone ==='')) {
        $('#daytimephoneError').text('Please input either daytime or cell phone.');
        $('#cellphoneError').text('Please input either daytime or cell phone.');
        validre = false;

    }else{
        // check either daytime phone or cellphone
        if(daytimephone !==''){
            if(!parseInt(daytimephone) || daytimephone.length !== 10) {
                $('#daytimephoneError').text('Please input 10-digit number');
                validre = false;
            }
        } else if(cellphone !==''){
            if(!parseInt(cellphone) || cellphone.length !== 10) {
                $('#cellphoneError').text('Please input 10-digit nubmer');
                validre = false;
            }
        }
    }


    // valid email  check
    if($('#email').val() !== '') {
        let emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        if(!emailReg.test($('#email').val())) {
            $('#emailError').text('Please input valid email.');
            validre = false;
        }

    }
    
    // Emergency Contact Name is required
    if($('#emergctname').val() === '') {
        $('#emergctnameError').text('Please input Emergency Contact Name.');
        validre = false;
    }

    // Contact phone is required
    let ctphone = $('#ctphone').val();
    if(ctphone === '') {
        $('#ctphoneError').text('Please input Contact Phone.');
        validre = false;
    }else{
        if(!parseInt(ctphone) || ctphone.length !== 10) {
            $('#ctphoneError').text('Please input 10-digit number.');
            validre = false;
        }
    }

    
    // all elements are setted propery then after submit, set all values and errors clear
    if(validre) {
        $('.alert').text('');
        location.reload();
    }
    
    
})

// when arrival time dropdown is selected
// 1. set leavetime option which is earler than arrival time disable 
// 2. after selected show the value in text field then make the drop down disapper insted of text field
// $('#atime').change(function(){
$("input[name=atimetxt]").focusout(function(){ 
    let atime = $(this).val().slice(0,2) + $(this).val().slice(3,5)
    let ltime = $("input[name=ltimetxt]").val().slice(0,2) + $("input[name=atimetxt]").val().slice(3,5)
    // remove disabled in leave time
    atime > 0 ? $('#ltimetxt').removeAttr('disabled') : $('#ltimetxt').attr('disabled', 'true')
    if(ltime > 0 && atime > ltime) $("input[name=ltimetxt]").val('');
    $('#ltimelist option').each(function(i, option){
        let ltime = option.value.slice(0,2) + option.value.slice(3,5)
        // $(this).attr('disabled', 'false')
        if($(this)[0].hasAttribute('disabled')) $(this).removeAttr('disabled');
        if(atime >= ltime){
           $(this).attr('disabled', 'true')
        }
    })

  
})


// when special diet is selected show label and txt box to discribe
$('#sdiet').on('click', function() {
    ddescribetxt = $('#ddescribe')
    ddescribelabel = $('#ddescribelabel')

    if(ddescribetxt.hasClass('disapper') && ddescribelabel.hasClass('disapper')) {
        ddescribetxt.removeClass('disapper')
        ddescribelabel.removeClass('disapper')

    }else{
        ddescribetxt.addClass('disapper')
        ddescribelabel.addClass('disapper')

    }
})

// when terrirotial is selected show label and txt box to discribe
$('[name=tempertment]').on('click', function() {

    let dterritorialtxt = $('#dterritorial')
    let dterritoriallabel = $('#dterritoriallabel')
    let val = $('input[name="tempertment"]:checked').val();
    if(val === 'terrirotial') {
        dterritorialtxt.removeClass('disapper')
        dterritoriallabel.removeClass('disapper')
    }else{
        dterritorialtxt.addClass('disapper')
        dterritoriallabel.addClass('disapper')
    }
})
