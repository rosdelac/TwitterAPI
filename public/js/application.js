$(document).ready(function() {
// ====================HIDE ALL FORMS==========================
  $('#loadingDiv').hide();
  $('#form1').hide();
  $('#form2').hide();
// ============================================================
  $('body').on('submit','#form1',function(event) {
    event.preventDefault();
    var cadena = $(this).serialize();
    $.post('/fetch',cadena,function(data)
    {       
      console.log(data);
      $('#tws').html("<h1>Tweets:</h1><br>"+data);
      
    });
      $('#tws').html('<h1>Loading...</h1><br><img src="/Loading_icon.gif"></img>');
  });

  $('body').on('submit','#form2',function(event) {
    event.preventDefault();
    var fulltweet = $('#form2').find('input[name="tweet"]').val().length;
    var cadena = $(this).serialize();

    if (fulltweet <= 140) {
    $.post('/tweet',cadena,function(data)
    {    
      $('#tws').html("<p style='color:green'>Tweet succesfully posted!</p>")   
      $('#form2')[0].reset();
    });
      $('#tws').html('<img src="/Loading_icon.gif"></img>');
    }
    else {
      $('#tws').html("<p style='color:red'>Error: tweet over 140 characters!</p>")
      $('#form2').find('input[name="tweet"]').focus();  
    };
  });

  $('body').on('click','#alltweets',function(event) {
    $('#form2').hide();
    $('#tws').html("");
    $('#form1').slideToggle();
    $('#form1').find('input[name="twitterhandle"]').focus();
  });

  $('body').on('click','#sendtweet',function(event) {
    $('#form1').hide();
    $('#tws').html("");
    $('#form2').slideToggle();
    $('#form2').find('input[name="tweet"]').focus();
  });


});
