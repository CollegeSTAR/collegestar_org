$('Document').ready(function() {
  var first_attendee_arrival_date_picker = $( "#student_support_summit_registration_first_attendee_arrival_date" ).datepicker({ 
    dateFormat: "yy-mm-dd",
    minDate: new Date()
  });
  var first_attendee_depature_date_picker = $( "#student_support_summit_registration_first_attendee_departure_date" ).datepicker({ 
    dateFormat: "yy-mm-dd",
    minDate: new Date()
  });
  var second_attendee_arrival_date_picker = $( "#student_support_summit_registration_second_attendee_arrival_date" ).datepicker({ 
    dateFormat: "yy-mm-dd",
    minDate: new Date()
  });
  var second_attendee_depature_date_picker = $( "#student_support_summit_registration_second_attendee_departure_date" ).datepicker({ 
    dateFormat: "yy-mm-dd",
    minDate: new Date()
  });
});
