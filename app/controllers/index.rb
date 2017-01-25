get '/' do
  erb :index
end

get 'login' do
  erb :log_in
end

post '/login' do
  @email = params[:email]
  @password = params[:password]

  if Count.authenticate(@email, @password)

    @user = Count.find_by(email: @email)
    session[:id] = @user.id
    erb :users_home
  else
    @user
    erb :index
  end
end

get '/newuser' do
  erb :sign_up
end

post '/newuser' do
  @user = Count.new(user: params[:user], email: params[:email], password: params[:password])

  if @user.save
    session[:id] = @user.id
    erb :users_home
  else
    @user
    erb :index
  end
end

before '/users_home/:id'  do
    if session[:id] == nil
      redirect to '/log_in'
    else
      erb :users_home
    end
  end

get '/users_home/:id' do
 @user = Count.find(session[:id])
end

post '/logout' do
  session.clear
  redirect to '/' 
end