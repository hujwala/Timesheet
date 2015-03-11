function timesheet_validator() {

  jQuery.validator.addMethod("alpha", function(value, element) {
    return this.optional(element) || value <= 1440 ;
  });

  $('#time_sheet1').validate({
    debug: true,
    rules: {

     "time_sheet[project_name]": {

       required: true,
       maxlength: 30
       
     },
     "time_sheet[description]": {
      required: true
      
    },
    "time_sheet[working_time]": {
      required: true,
      alpha: true

    }
  },

  errorElement: "span",
  errorClass: "help-block",

  messages: {

    "time_sheet[project_name]": {
      required: "Project name is required",
      maxlength: "exceed length"
      
    },
    "time_sheet[description]": {
      required:"Description is required"
      
      
    },
    "time_sheet[date]": {
      required:"Date is required"
      
      
    },
    "time_sheet[working_time]": {
      required:"Working_time is required",
      number:"It must contain only numbers ",
      alpha: "Exceeds 24 hours"

      
    }
  },
  highlight: function(element) {
   $(element).parent().parent().addClass("has-error");
 },

 unhighlight: function(element) {
  $(element).parent().parent().removeClass("has-error");
},

invalidHandler: function(event, validator) {
        // 'this' refers to the form
        var errors = validator.numberOfInvalids();
        if (errors) {

          // Populating error message
          var errorMessage = errors == 1
          ? 'You missed 1 field. It has been highlighted'
          : 'You missed ' + errors + ' fields. They have been highlighted';

          // Removing the form error if it already exists
          $("#div_user_js_validation_error").remove();

          errorHtml = "<div id='div_user_js_validation_error' class=\"alert alert-danger\" data-alert=\"alert\" style=\"margin-bottom:5px;\">"+ errorMessage +"</div>"
          //$("#div_user_details").prepend(errorHtml);
          $("#div_modal_generic div.modal-body-main").prepend(errorHtml);

          // Show error labels
          $("div.error").show();

        } else {
          // Hide error labels
          $("div.error").hide();
          // Removing the error message
          $("#div_user_js_validation_error").remove();
        }

      },
      
    });

}

$(document).ready(function(){
  $('#timesheetDate').datepicker({
    dateFormat: 'yy-mm-dd'
  });
  
  $(document).on('click', '#edit-time-sheet', function(e){
    $("#edit_time_sheet").submit();
    window.location.reload();
    e.preventDefault();
  })
  
  setTimeout(function(){
    $('#flash').remove();
  }, 5000);


});
