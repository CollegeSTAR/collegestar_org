$(document).ready(function() {
  $('#user-menu-wrapper').hover(function() {
    $('#user-dropdown').css('display', 'inherit');
  }, function() {
    $('#user-dropdown').css('display', 'none');
  });
});
