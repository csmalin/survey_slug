$(document).ready(function(){
  var pass = true ;
   
  function IsEmail(email) {
    var regex = /(\S{2,}@\S*\S.(com|net|me|org))/;
    if (!regex.test(email)) {
     $('#errors').append("<li>Email not valid</li>");
      pass = false
    };
   
  }
   
  function IsPassword(password) {

     if (password.length < 8) {
        $('#errors').append("<li>Password must be at least 8 characters long</li>");
        pass = false;
     };
     if (!(/[A-Z]+/).test(password)) {
        $('#errors').append("<li>Password needs at least one capital letter</li>");
        pass = false;
     };
     if (!(/[0-9]+/).test(password)) {
        $('#errors').append("<li>Password needs at least one numeric character</li>");
        pass = false;
     };
   
  };
   
   
  $('form.signup').submit(function(e) {
    pass = true;
    $('ul#errors').empty();
    IsEmail($("input#signup_email").val());
    IsPassword($("input#signup_password").val());

    if (pass == false) {
        e.preventDefault();
    };
  });
});


