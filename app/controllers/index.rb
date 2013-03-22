get '/' do
  erb :index
end


# User Signup/Login

post '/login' do
  @user = User.find_by_username(params[:user]["email"])
  if User.authenticate(params[:user])
     session[:id] = @user.id

     redirect "/profile"
  else
     # @error = "You need a proper (and unique) email and password"
     erb :index
  end
end

post '/signup' do
  @user = User.new(params[:user])
  unless @user.save
    # Errors?
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

# get '/profile' do
#   @user = User.find(session[:id])
# end

