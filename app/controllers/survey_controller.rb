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

  redirect '/profile'
end

get '/browse' do 
  @surveys = Survey.order("created_at DESC")
  erb :browse
end

get '/survey/:id/results' do
  @survey = Survey.find(params[:id])
  # @results = ActiveSurvey.where('active_survey_id = ?', @active_survey.id)
  erb :survey_results
end

delete '/survey/:id/results' do
  @survey = Survey.find(params[:id])
  @survey.destroy
end
# get '/profile/:id/results' do
#   @survey = ActiveSurvey.find(params[:id])
#   @questions = Survey.find(@survey.survey_id).questions
  
#   my_as = User.find(current_user.id).active_surveys
#   my_res = my_as.find(params[:id]).responses
#   to_find_option = my_res.option_id

#   my_questions = []
#   my_answers = []
  
#   to_find_option.each do |option|
#     my_questions << option.question_id
#     my_answers << option.option_id
#   end
  
#   @questions_for_view = []
#   @answers_for_view = []
  
#   my_questions.each do |x|
#     @questions_for_view << Question.find(x).inquisition
#   end

#   my_answers.each do |x|
#     @answers_for_view << Option.find(x).choice
#   end

#   erb :individual_results
# end

get '/survey/:id/take' do
  @survey = Survey.find(params[:id])
  survey_takers = []

  @survey.active_surveys.each do |active_survey|
    survey_takers << active_survey.user_id
  end
  
  if survey_takers.include?(current_user.id)
    erb :survey_results
  else
    erb :take_survey
  end
end

post '/survey/:id/take' do
  @survey = Survey.find(params[:id])
  #if active survey holds current_user id, redirect to a "no double dipping page"
  @active_survey = ActiveSurvey.create :survey_id => @survey.id,
                                       :user_id => current_user.id,
                                       :title => @survey.title

  params[:option].each_pair do |k, v|
    Response.create :question_id => k,
                    :option_id => v,
                    :active_survey_id => @active_survey.id.to_i                     
  end
  redirect '/profile'
end
