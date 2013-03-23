get '/survey' do
  erb :create_survey
end

post '/survey' do

  puts params
  @survey = Survey.create :description => params[:survey][:description],
                          :title => params[:survey][:title]
#TODO: how many times to step through?
  @question = Question.create :inquisition => params[:question][:inquisition],
                  :survey_id => @survey.id
  Option.create :choice => params[:option][:choice],
                :question_id => @question.id
                puts "*" *100
    puts params
    puts "*" *100
  redirect '/'
end
