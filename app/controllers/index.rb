get '/' do
  erb :index
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

# get '/profile' do
#   @user = User.find(session[:id])
# end

