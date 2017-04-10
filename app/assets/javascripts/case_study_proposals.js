$("Document").ready(function() {
  var completion_date_picker = $( "#case_study_proposal_completion_date" ).datepicker({ 
    dateFormat: "yy-mm-dd",
    minDate: new Date()
  });  
  var start_date_picker = $( "#case_study_proposal_start_date" ).datepicker({ 
    dateFormat: "yy-mm-dd",
    minDate: new Date()
  });

});
