get '/' do
  erb :index
end

post '/login' do
  @user = User.find_by_email(params[:user]["email"])
  if User.authenticate(params[:user])
    session[:id] = @user.id
    redirect "/profile"
  else
    erb :index
  end
end

post '/signup' do
  @user = User.new(params[:user])
  puts params[:password]
  unless @user.save
    erb :index
  else
    session[:id] = @user.id

    redirect "/profile"
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/profile' do
  @user = User.find(session[:id])
  @created_surveys = Survey.where('user_id = ?', @user.id)
  @answered_surveys = ActiveSurvey.where('user_id = ?', @user.id)

  erb :profile
end

