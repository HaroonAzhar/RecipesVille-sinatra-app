class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_secret"
  end
  use Rack::Flash

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login 
  end



  post '/login' do

     if !params[:username] || !params[:password]
       flash[:message]= 'fill all the login details'
       redirect "/login"

     end
    user = User.find_by(username: params[:username])
 
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/recipes/index"
    else
           flash[:message]= 'incorrect login details'
        redirect "/login"
    end
  end


  helpers do
  

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    

  end



end