get '/survey' do
  erb :create_survey
end

post '/survey' do

    puts params
    puts "*" *100
    puts params[:survey][:title]
    puts params[:survey][:description]

    @survey = Survey.create :description => params[:survey][:description],
                              :title => params[:survey][:title]

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
