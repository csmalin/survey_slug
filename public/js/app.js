$(document).ready(function(){
  var questionCounter = 1;
  var optionCounter;
  
  $('#add-question').click(function(e){
    e.preventDefault();
    var questionTemplate = "<div class='question-box' id = '" + questionCounter + "'><input type='text' id = '" + questionCounter + "' class='question' name='question[" + questionCounter + "]' placeholder='question'>"
        questionTemplate += "<a class='remove-question' id = " + questionCounter + ">[-]</a> "
        questionTemplate += "<a class='add-choice' id = " + questionCounter + ">Add Choice</a>"
        questionTemplate += "<input type='text' name='option["+questionCounter+"][]'  placeholder='option'>"
        questionTemplate += "<input type='text' name='option["+questionCounter+"][]'  placeholder='option'> </div>"
    questionCounter++;
    $('.question-box').last().after(questionTemplate);
  });

});


 $(document).delegate(".add-choice", "mouseup", function(event){
  event.stopPropagation();
  event.preventDefault();
  var questionNumber = parseInt(event.target.id); 
  var optionTemplate = "<input type='text' name='option[" + questionNumber +"][]'  placeholder='option'>";
  console.log($('#' + questionNumber + '.add-choice').attr('id'));
  $('#' + questionNumber + '.add-choice').append(optionTemplate);
  });

  $(document).delegate(".remove-question", "mouseup", function(event){
  event.stopPropagation();
  event.preventDefault();
  var questionNumber = parseInt(event.target.id); 
  console.log('.question-box#' + questionNumber);
  $('.question-box#' + questionNumber).hide( "drop", { direction: "left" }, 500, function(){
    $('.question-box#' + questionNumber).remove()});
  });




