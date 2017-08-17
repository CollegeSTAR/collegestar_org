
function handle_image_dropzone_dragover(event) {
  event.preventDefault();
}

function handle_image_drop(event) {
  event.preventDefault();
  var dataTransfer = event.dataTransfer;

  if (dataTransfer.items) {
    // Use DataTransferItemList interface to access the file(s)
    for (var i=0; i < dataTransfer.items.length; i++) {
      if (dataTransfer.items[i].kind == "file") {
        var file = dataTransfer.items[i].getAsFile();
        console.log("... file[" + i + "].name = " + file.name);
      }
    }
  } else {
    // Use DataTransfer interface to access the file(s)
    for (var i=0; i < dataTransfer.files.length; i++) {
      console.log("... file[" + i + "].name = " + dataTransfer.files[i].name);
    }  
  }
}
