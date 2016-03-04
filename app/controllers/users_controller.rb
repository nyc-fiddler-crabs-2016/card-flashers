get '/users' do
  "hello"
end

get '/login' do
  erb :'/users/login'
end

post '/login' do
  if @user = User.find_by(user_name:params[:user_name])
   params[:password] == @user.password
      redirect "/users/#{@user.id}"
    else
      @errors = "Thats wrong stupid"
      erb :'/users/login'
    end
end
