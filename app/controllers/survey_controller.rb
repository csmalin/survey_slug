get '/survey/create' do
  erb :create_survey
end

post '/survey/create' do

    puts params
    puts "*" *100
    puts params[:survey][:title]
    puts params[:survey][:description]

    @survey = Survey.create :description => params[:survey][:description],
                            :title => params[:survey][:title],
                            :user_id => current_user.id
    
    params[:question].each_pair do |key, question|
      puts question
      @question = Question.create :inquisition => question,
                                  :survey_id => @survey.id
      
      params[:option][key].each do |option|
        puts option
        Option.create :choice => option,
                      :question_id => @question.id
      end
    end

  redirect '/'
end

get '/survey/take' do
  erb :take_survey
end

post '/survey/:id/take' do
##create responses to question
  @survey = Survey.find(params[:id])
  @active_survey = ActiveSurvey.create 
end
