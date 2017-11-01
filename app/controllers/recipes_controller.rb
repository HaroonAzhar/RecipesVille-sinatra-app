class RecipeController < ApplicationController
	
	get '/recipes/index' do 
       erb :'/recipes/index'
	end
	get '/recipes/new' do
		erb :'/recipes/new'
	end
	post '/recipes/create' do 
         raise params.inspect
	end

	

end
