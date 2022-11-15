$(document).ready(function( ) {
  //2-a
  $('h1').text('Lab08')

  // 2-b
  $('#header').html('<span>Working with Jquery</span>')

  // 2-c
  $('input[type="button"]').each(function(i) {
    // execute one of buttons are clicked
    $(this).on('click', function(){
      $(this).addClass('btn-background')
    })
  })

  // 2-d
  $('#buttons').addClass('red-border')

  // 2-e
  $('p').each(function(){
    $(this).addClass('blue')
  })

  // 2-f
  $('#first').on('click', function(){
    $('p:first').addClass('green-border')
  })

  // 2-g
  $('#last').on('click', function(){
    $('p:last').addClass('orange-border')
  })

  // 2-h
  $('#prev').on('click',function(){
    // get id=para2 using prev()
    $('#para3').prev().addClass('purple-border')
  })

  // 2-i
  $('#next').on('click', function(){
    // get id=para2 using next()
    $('#para1').next().addClass('yellow-border')
  })

  // 2-j
  $('#remove').on('click', function(){
    $('#footer').remove()
  })

});
