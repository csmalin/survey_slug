$(document).ready(function(){
  $('.delete').click(function(e){
    e.preventDefault();
    $(this).closest('li').fadeOut('slow');
    var survey_id = $('#surveyid').attr('href');
    $.ajax ({
      type: "DELETE",
      url: survey_id
    }).done(function(){
      console.log("deleted");
    }).fail(function(textStatus){
      alert(textStatus);
    })
  })
})
