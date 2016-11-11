$('Document').ready( function() {
  $('#flash-notice-close').click(function() {
    close_notice( this );
  });
  $('#flash-error-close').click(function() {
    close_notice( this );
  });
  auto_close_notifications(); 
});

function close_notice( caller ) {
  $('#' + caller.id).parent().fadeOut(1000);
}

function auto_close_notifications() {
  window.setTimeout(hide_flash_wrapper, 4000); 
}

function hide_flash_wrapper() {
  $('#flash-wrapper').fadeOut(1000);
}
