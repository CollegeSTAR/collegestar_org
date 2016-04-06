$('Document').ready(function() {

  $('#new_redesign_summary_attachment').fileupload({
    dataType: 'json',
    done: function(e, data) {
      console.log("Complete!");
    },
    dropZone: $('#attachment-drop-zone'),
    progressall: function (e, data) {
      progress( e, data );       
    }
      });
  
  //When the dropzone is clicked, fire the file input
  $('#redesign-summary-attachment-drop-zone').click( function() {
    $('#redesign_summary_attachment_attachment').trigger('click');
  });

  //If we don't have javascript, we do not want to show the dropzone and
  //we do want to show the file upload dialogue.
  $('#redesign-summary-attachment-upload-wrapper').addClass('hidden');
  $('#redesign-summary-attachment-drop-zone-wrapper').removeClass('hidden');
});

function progress( e, data ) {
  $('#attachment-upload-progress').removeClass('hidden');
  var progress = parseInt(data.loaded / data.total * 100, 10);
  $('#attachment-upload-progress #progress-bar').css(
    'width',
    progress + '%'
  );
}

function upload_complete( e, data ) {
  $('#attachment-upload-progress #progress-bar').css( 'width', '0%');
  $('#attachment-upload-progress').addClass('hidden');
  $.each(data.result.files, function(index, file) {
    $('<p/>').text(file.name).appendTo(document.body);
  });
}
