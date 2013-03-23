$(document).ready(function(){
  var questionCounter = 1;
  var optionCounter;
  
  $('#add-question').click(function(e){
    e.preventDefault();
    var questionTemplate = "<div class='questions'><input type='text' id = '" + questionCounter + "' class='question' name='question[" + questionCounter + "][question]' placeholder='question'>"
        questionTemplate += "<a class='add-choice' id = " + questionCounter + ">Add Choice</a>"
        questionTemplate += "<input type='text' name='option["+questionCounter+"][][choice]'  placeholder='option'>"
        questionTemplate += "<input type='text' name='option["+questionCounter+"][][choice]'  placeholder='option'> </div><br><br>"
    questionCounter++;
    $('.questions').last().after(questionTemplate);
  });

  function someBullshit(){
    var questionNumber = parseInt(event.target.id); 
    var optionTemplate = "<input type='text' name='option[" + questionNumber +"][][choice]'  placeholder='option'>"
    console.log($('#' + questionNumber + '.add-choice').attr('id'));
    $('#' + questionNumber + '.add-choice').append(optionTemplate)
  };

 $('.questions').on("mouse", "mouseup", function(){
  console.log("a click");
    someBullshit();
  });

});




