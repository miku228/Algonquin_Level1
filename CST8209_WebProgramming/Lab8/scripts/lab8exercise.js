$(document).ready(function( ) {
  //2-a
  $('h1').text('Lab08')

  // 2-b
  $('#header').html('<span>Working with Jquery</span>')

  // 2-c
  $('input[type="button"]').each(function(i) {
    // execute one of buttons are clicked
    $(this).on('click', function(){
      if($(this).hasClass('btn-background')){
        $(this).removeClass('btn-background')
      }else{
          $(this).addClass('btn-background')
      }

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
    pfirst = $('p:first')
    if(pfirst.hasClass('green-border')){
      pfirst.removeClass('green-border')
    }else{
      pfirst.addClass('green-border')
    }
  })

  // 2-g
  $('#last').on('click', function(){
    plast = $('p:last');
    if(plast.hasClass('orange-border')){
        plast.removeClass('orange-border')
    }else{
        plast.addClass('orange-border')
    }

  })

  // 2-h
  $('#prev').on('click',function(){
    // get id=para2 using prev()
    para3pre = $('#para3').prev();
    if(para3pre.hasClass('purple-border')){
        para3pre.removeClass('purple-border')
    }else{
        para3pre.addClass('purple-border')
    }
  })

  // 2-i
  $('#next').on('click', function(){
    // get id=para2 using next()
    para1next = $('#para1').next();
    if(para1next.hasClass('yellow-border')){
        para1next.removeClass('yellow-border')
    }else{
        para1next.addClass('yellow-border')
    }

  })

  // 2-j
  $('#remove').on('click', function(){
    // if($('#remove').hasClass('btn-background')){
    //     $('#footer').append($('#footer').detach())
    // }else{
        $('#footer').remove()
    // }

  })

});
