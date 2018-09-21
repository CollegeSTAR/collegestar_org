$('Document').ready(function() {
  var urlParams = new URLSearchParams(window.location.search);
  var feedback  = urlParams.get('feedback');
  if (feedback == "false") {
    var feedback_shown = true;
  } else {
    var feedback_shown = false;
  }
  
  $('.show-module-section-audio-player-toggle').click(function(e) {
    e.preventDefault();
    var id_array = this.id.split("show-module-section-audio-player-toggle-");
    var id = id_array[1]
    $('#module-section-audio-' + id).removeClass('hidden');
    $('#show-module-section-audio-player-toggle-wrapper-' + id).addClass('hidden');
  });
  
  $('#learn-more').waypoint(function() {
      if( !feedback_shown ) {
        $('#feedback-modal').removeClass('hidden');
      }
      feedback_shown = true;
    }, {
    offset: '50%' 
  });

  $('#feedback-modal-close-button').click(function(e) {
    $('#feedback-modal').addClass('hidden');
  });
  
  $('#feedback-thumbs-up').click(function(e) {
    e.preventDefault();
    send_feedback(true);
  });
  
  $('#feedback-thumbs-down').click(function(e) {
    e.preventDefault();
    send_feedback(false);
  });
});

function send_feedback(feedback) {
  var current_user = $('#feedback-request-wrapper').data("user");
  var udl_module = $('#feedback-request-wrapper').data("udl-module");
  var end_point = $(location).attr('origin') + "/api/v1/module-feedback";
  $.ajax({
    method: "POST",
    headers: "ACCEPTS: application/json",
    url: end_point,
    data: { udl_module_feedback: {udl_module: udl_module, user: current_user, resource_was_helpful: feedback }}
  }).done(function(data) {
    if(feedback) { //was it positive feedback or negative?
      $('#feedback-request-wrapper').addClass('hidden');
      $('#feedback-was-helpful-complete').removeClass('hidden');
    } else {
      $('#feedback-request-wrapper').addClass('hidden');
      $('#feedback-was-not-helpful-complete').removeClass('hidden');   
    }
  }).fail(function(data){
    console.log(data);
  });
}
