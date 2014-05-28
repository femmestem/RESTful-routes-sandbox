get '/users/new' do
  erb :new_user
end

post '/login' do
  user = User.authenticate(email: params[:email], password: params[:password])

  if user
    session[:user_id] = user.id
    redirect to # '/?' # where should a user be redirected after logging in?
  else
    redirect to '/'
  end
end