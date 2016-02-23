$("Document").ready( function() {
  $("#search_bar_noScript").attr("id", "search_bar");  
  
  var search_bg_file = $('#search_bar').css('background-image');

  $('#search_text').delay(500).css(
			{
				"width": "50px",
				"color": "#999",
				"outline": "none"
			});
  $('#search_icon').delay(500).css(
			{
				"background-position": "0px 0px"
			});
  var searchMode = false;
	//Expand the search field when clicked
	$('#search_bar').click(function(){
		$('#search_bar').animate({"width": "300px"}, 750, function(){
			$('#search_bar').delay(500).css(
			{
				"background": "#fff", 
				"cursor": "auto", 
				"box-shadow": "none"
			});
			$('#search_icon').delay(500).css(
			{
				"background-position": "0px -28px"
			});
			$('#search_text').delay(500).css(
			{
				"width": "270px",
				"outline": "none"
			});
			$('#search_text').delay(500).focus();
		});
		searchMode = true;
	});
	//Shrink and reset if something else is clicked and no text entered
	$('#search_text').blur(function(){
		if($(this).val().length <= 0)
		{
			$(this).css(
			{
				"background-color": "transparent"	
			});
			$('#search_icon').delay(500).css(
			{
				"background-position": "0px 0px"
			});
			$('#search_text').delay(500).css(
			{
				"width": "50px"
			});
			
			$('#search_bar').css(
			{
				"background": "#333 url(" + search_bg_file + ") repeat-x 0px 0px", 
				"cursor": "text", 
				"box-shadow": "1px 1px 5px #000 inset"
			});
			$('#search_bar').delay(250).animate({"width": "120px"}, 750); 
			
		}
	});
	
	//If search icon clicked after search mode entered, submit the search
	$('#search_icon').click(function(){
		if($('#search_text').val().length > 3){
			$("#searchform").submit();
		}
		
		});
});
