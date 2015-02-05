function validatesignupform {
$("#new_user").validate({
debug: true,
rules: {
"user[name]": {require:true, /\w+/[A-Z]/ },
"user[email]": {required: true, email: true, remote:"/users/check_email" },  
"user[password]": {required: true, minlength: 6},
"user[password_confirmation]": {required: true, equalTo: "#user_password"}
}
});
}