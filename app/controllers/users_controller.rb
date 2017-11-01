class UserController < ApplicationController
	
     get '/users/new' do
     	erb :'/users/new'
     end

     post '/users/create' do
     	#raise params.inspect
     	user = User.new(username: params[:username], password: params[:password])
 
         if user.save
           redirect "/login"
   	     else
            redirect "/users/signup"
         end
     end


	

	
end

