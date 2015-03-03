$(document).ready(function(){
  
  var date = $("#timesheetDate").val();
  $("#hiddenDate").val(date);

  function updateHiddenField() {
    date = $("#timesheetDate").val();
    $("#hiddenDate").val(date);
  }

  $("#timesheetDate").on("change", updateHiddenField)
   
});


