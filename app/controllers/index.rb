get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create' do
  erb :create
end

post '/create' do
  User.create(full_name: params[:full_name], email: params[:email], password: params[:password])
  redirect "/?create=success"
end

post '/' do
  # new_user = User.new
  if User.valid?(params[:email])
    new_user = User.where(email: params[:email]).first
    if new_user.authenticate(params[:password])
      'You are logged in'
    else
      'wrong password'
    end
  else
    'Invalid User'
  end
end