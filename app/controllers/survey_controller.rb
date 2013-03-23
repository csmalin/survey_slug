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

get '/browse' do 
  @surveys = Survey.all
  erb :browse
end

get '/survey/:id/results' do
  @survey = Survey.find(params[:id])
  # @results = ActiveSurvey.where('active_survey_id = ?', @active_survey.id)
  erb :survey_results
end

get '/survey/:id/take' do
  @survey = Survey.find(params[:id])
  erb :take_survey
end

post '/survey/:id/take' do
  @survey = Survey.find(params[:id])
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
