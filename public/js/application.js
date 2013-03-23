$(document).ready(function(){
  
  $('a.login').on('click', function(e){
    e.preventDefault();
    
    if ($('form.login').css("visibility") == "hidden")
      {
        $('form.login').css("visibility", "visible");
      }
    else
      {
        $('form.login').css("visibility", "hidden")
      }
  });

});
