$('Document').ready( function() {

  if( !$('#nav').hasClass('hidden') ) {
    $('#nav').addClass('hidden');
  }

  $('#menu').click( function() {
    if ( $('#nav').hasClass('hidden') ) {
      $('#nav').removeClass('hidden');
    } else {
      $('#nav').addClass('hidden');
    }
  });
});
