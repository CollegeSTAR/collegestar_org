$('Document').ready(function() {
  $('#image').cropper({
    aspectRatio: 16 / 9,
    crop: function(e) {
      // Output the result data for cropping image.
      console.log("Pos x: " + e.x);
      console.log("Pos y: " + e.y);
      console.log("Width: " + e.width);
      console.log("Height: " + e.height);
      console.log(e.rotate);
      console.log(e.scaleX);
      console.log(e.scaleY);
    }
  });
});
