// On pages with a sidebar, the sidebar's height needs
// to be equal to the height of the main content.

$(window).load(function() {
  col_fix();
});

function col_fix() {
  var max_height = $("#right-column-wrapper").height();
  var total_border_height = 2;
  $("#left-column-wrapper").height(max_height - total_border_height + "px");
}
