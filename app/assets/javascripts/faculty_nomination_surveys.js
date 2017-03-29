$('Document').ready( function() {
  var show_example_teaching_strategy_link = $('#show-example-teaching-strategy-link');
  var hide_example_teaching_strategy_link = $('#hide-example-teaching-strategy-link');
  var show_example_strategy_description_link = $('#show-example-strategy-description-link');
  var hide_example_strategy_description_link = $('#hide-example-strategy-description-link');
  var show_example_strategy_description_link = $('#show-example-strategy-description-link');
  var hide_example_strategy_description_link = $('#hide-example-strategy-description-link');
  var show_example_reasons_for_effectiveness_link = $('#show-example-reasons-for-effectiveness-link');
  var hide_example_reasons_for_effectiveness_link = $('#hide-example-reasons-for-effectiveness-link');

  //We default to not showing the example links incase a user has javascript disabled
  $('.show-example-link').removeClass('hidden')

  show_example_teaching_strategy_link.click(function(event) {
    event.preventDefault();
    $('#teaching-strategy-example').removeClass('hidden');
    show_example_teaching_strategy_link.addClass('hidden');
  });

  hide_example_teaching_strategy_link.click(function(event) {
    event.preventDefault();
    $('#teaching-strategy-example').addClass('hidden');
    show_example_teaching_strategy_link.removeClass('hidden');
  });

  show_example_strategy_description_link.click(function(event) {
    event.preventDefault();
    $('#strategy-description-example').removeClass('hidden');
    show_example_strategy_description_link.addClass('hidden');
  });

  hide_example_strategy_description_link.click(function(event) {
    event.preventDefault();
    $('#strategy-description-example').addClass('hidden');
    show_example_strategy_description_link.removeClass('hidden');
  });  
  
  show_example_reasons_for_effectiveness_link.click(function(event) {
    event.preventDefault();
    $('#reasons-for-effectiveness-example').removeClass('hidden');
    show_example_reasons_for_effectiveness_link.addClass('hidden');
  });

  hide_example_reasons_for_effectiveness_link.click(function(event) {
    event.preventDefault();
    $('#reasons-for-effectiveness-example').addClass('hidden');
    show_example_reasons_for_effectiveness_link.removeClass('hidden');
  });
});
