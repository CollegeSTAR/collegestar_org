$('Document').ready(function() {
  $('.show-module-section-audio-player-toggle').click(function(e) {
    e.preventDefault();
    var id_array = this.id.split("show-module-section-audio-player-toggle-");
    var id = id_array[1]
    $('#module-section-audio-' + id).removeClass('hidden');
    $('#show-module-section-audio-player-toggle-wrapper-' + id).addClass('hidden');
  });
});
