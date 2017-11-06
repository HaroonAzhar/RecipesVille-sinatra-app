class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "coffee_secret"
  end
  

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


  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def authenticate_user
      redirect to '/login' if !logged_in?
    end

  end



end