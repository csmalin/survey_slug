$(document).ready(function(){
  var questionCounter = 1;
  var optionCounter;
  
  $('#add-question').click(function(e){
    e.preventDefault();
    var questionTemplate = "<li><input type='text' id = " + questionCounter + "class='question' name='question[" + questionCounter + "][question]' placeholder='question'></li><button class='add-choice' id = " + questionCounter + ">Add Choice</button>"
    questionCounter++;
    $('.questions').append(questionTemplate);
    $('.questions').append("<li id='1'><input type='text' name='option["+questionCounter+"][0][choice]'  placeholder='option'></li>");
    $('.questions').append("<li id='2'><input type='text' name='option["+questionCounter+"][1][choice]'  placeholder='option'></li>");
  });


  $('.add-choice').click(function(e){
    e.preventDefault();
    var questionNumber = parseInt(event.target.id);
    var id = '#' + String(questionNumber);
    var currentQuestion = $(id + '.question');
    alert(currentQuestion);
    var questionId = $('.question').attr('id'); 
    
    var optionTemplate = "<li><input type='text' name='option[" + questionNumber + "][ ][choice]' placeholder='option'></li>"
  })
});
