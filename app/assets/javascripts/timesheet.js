function timesheet_validator() {
  jQuery.validator.addMethod("number", function(value, element) {
    var isValid = /^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$/.test(value);
    console.log(isValid);
    return isValid;
  });

  $('#time_sheet').validate({
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
      number: true


    }
  },

  errorElement: "span",
  errorClass: "help-block",

  messages: {

    "time_sheet[project_name]": {
      required: "This field is required",
      maxlength: "exceed length"
      
    },
    "time_sheet[description]": {
      required:"This field is required"
      
      
    },
    "time_sheet[working_time]": {
      required:"This field is required",
      number:"It must contain only numbers "
      
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


