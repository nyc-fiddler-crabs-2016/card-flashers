get '/users' do
  "hello"
end

get '/login' do
  erb :'/users/login'
end

post '/login' do
  if @user = User.find_by(user_name:params[:user_name])
    if params[:password] == @user.password
      redirect "/users/#{@user.id}"
    else
      @errors = "Password is wrong"
      erb :'/users/login'
    end
  else
      @errors = "That's wrong"
      erb :'/users/login'
  end
end
