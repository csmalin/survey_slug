get '/survey/create' do
  erb :create_survey
end

post '/survey/create' do
  @survey = Survey.create :description => params[:survey][:description],
                          :title => params[:survey][:title],
                          :user_id => current_user.id
  
  params[:question].each_pair do |key, question|
    @question = Question.create :inquisition => question,
                                :survey_id => @survey.id
    
    params[:option][key].each do |option|
      Option.create :choice => option,
                    :question_id => @question.id

    end
  end

  photouploader = PhotoUploader.new
  photouploader.store!(params['photo'])

  Picture.create   :survey_id => @survey.id,
                   :picture => params['photo'][:filename]
                   
  redirect '/profile'
end

get '/browse' do 
  @surveys = Survey.order("created_at DESC")
  erb :browse
end

get '/survey/:id/results' do
  @survey = Survey.find(params[:id])
  erb :survey_results
end

delete '/survey/:id/results' do
  @survey = Survey.find(params[:id])
  @survey.destroy
end


get '/survey/:id/take' do
  @survey = Survey.find(params[:id])
  survey_takers = []

  @survey.active_surveys.each do |active_survey|
    survey_takers << active_survey.user_id
  end
  
  if current_user
    if survey_takers.include?(current_user.id)
      erb :survey_results
    else
      erb :take_survey
    end
  else
    erb :guest_view
  end
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
