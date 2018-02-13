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

  $('#instructional-supports').hover(function() {
    $('#instructional-supports-sub-menu').removeClass('dropdown-toggle');    
  },
  function() {
    $('#instructional-supports-sub-menu').addClass('dropdown-toggle');
  });
  
  $('#student-supports').hover(function() {
    $('#student-supports-sub-menu').removeClass('dropdown-toggle');    
  },
  function() {
    $('#student-supports-sub-menu').addClass('dropdown-toggle');
  });

});
