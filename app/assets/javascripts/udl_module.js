$('Document').ready(function() {
  var feedback_shown = false;

  $('.show-module-section-audio-player-toggle').click(function(e) {
    e.preventDefault();
    var id_array = this.id.split("show-module-section-audio-player-toggle-");
    var id = id_array[1]
    $('#module-section-audio-' + id).removeClass('hidden');
    $('#show-module-section-audio-player-toggle-wrapper-' + id).addClass('hidden');
  });
  
  $('#learn-more').waypoint(function() {
      //if( !feedback_shown ) {
      //  $('#feedback-modal').removeClass('hidden');
      //}
      console.log('Triggered Feedback modal');
      feedback_shown = true;
    }, {
    offset: '50%' 
  });

  $('#feedback-modal-close-button').click(function(e) {
    $('#feedback-modal').addClass('hidden');
  });
  
  $('#feedback_thumbs_up').click(function(e) {
    e.preventDefault();
    $.ajax({
      url: 'http://localhost:3000'
    }).done(function(data) {
      console.log("data:", data);
    });
  });
  
});
