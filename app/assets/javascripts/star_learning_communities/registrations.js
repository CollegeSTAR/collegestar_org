$('Document').ready( function() {
  
  var slc = $('#star_learning_community_registration_slc');
  var options_div = $('#star_learning_communities_registrations_other_options');
  slc.change( function() {
    if( slc.val() == "Other") {
      options_div.removeClass('hidden');
    } else {
      options_div.addClass('hidden');    
    }
  });
});
