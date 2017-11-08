class UserController < ApplicationController
	
     get '/users/new' do
     	erb :'/users/new'
     end

     post '/users/create' do
     	
         
     	user = User.new(username: params[:username], name: params[:name] ,password: params[:password])
 
         if user.save
           redirect "/login"
   	     else
            flash[:message]='fill in all the details'
            redirect "/users/signup"
         end
     end


	

	
end

