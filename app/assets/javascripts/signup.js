function UserValidator() {


  jQuery.validator.addMethod("pswd_match",function (value,element){
    return $("#input_password").val() == $('#input_confirmation_password').val();
  });

  jQuery.validator.addMethod("alpha", function(value, element) {
    return this.optional(element) || value == value.match(/^[a-zA-Z ]+$/);
  });

  $('#sign_up').validate({
    debug: true,
    rules: {
      "user[name]": {
        required: true,
        alpha: true
      },
      "user[email]": {
       required: true,
       email: true,
       remote:"/users/check_email"
     },
     "user[password]" : {
      required: true,
      minlength: 6
      
    },
    "user[password_confirmation]": {
      required: true,
      pswd_match: true
    }
  },

  errorElement: "span",

  errorClass: "help-block",
  messages: {
   "user[name]": {
    required: "Name is required",
    alpha: "should contain only alphabets"
  },
  "user[email]": {
    required: "Email is required",
    email: "Please enter a valid E-Mail address!",
    remote: "Email has already been taken"
  },
  "user[password]": {
    required:"Password is required",
    minlength:"Enter minimum 6 characters!"
  },
  "user[password_confirmation]": {
    required: "Password_confirmation is required",
    pswd_match: "Password match"
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

      submitHandler: function(form) {

       form.submit();
     }
   });
setTimeout(function(){ $("#exampleInputFile").change(function(){
  if (this.files && this.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('#preview').attr('src', e.target.result);
    }
    reader.readAsDataURL(this.files[0]);
  }
});
 }, 400);
}




