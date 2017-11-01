class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  enable :sessions
  

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login 
  end

  post '/login' do
    user = User.find_by(username: params[:username])
 
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/recipes/index"
    else
        redirect "/login"
    end
  end


end