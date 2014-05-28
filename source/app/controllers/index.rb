# Index page displays login form and link to create new user account
get '/' do
  erb :login
end

post '/logout' do
  session[:user_id] = nil
  redirect to '/'
end

# for development debugging only; remove in production
get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end
