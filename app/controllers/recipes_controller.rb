class RecipeController < ApplicationController
	
	get '/recipes/index' do 
       erb :'/recipes/index'
	end
	get '/recipes/new' do
		erb :'/recipes/new'
	end
	
	 post '/recipes/create' do 
	 	 user=current_user
	 	 @recipe=Recipe.new
	 	 @recipe.name=params[:name]
           
         
	 	 params[:ingredients].each_with_index do |ingredients,index|
	 	 	     ingredients.keys.each do |ingredient_name|
					
					  ingredient= Ingredient.find_by(name: ingredient_name)
				      @recipe.ingredients<<ingredient
				      @recipe.save
				      @recipe.recipe_ingredients.find_by(ingredient_id: ingredient.id).quantity=params[:ingredients][index][ingredient_name][:quantity]
                      @recipe.save

				    
              
                  end
	     
	 	 end
	 	 a=current_user
	 	 a.recipes<<@recipe
	 	 a.save

	  redirect "/recipes/<%=recipe.id%>/show"
	 end

	 get '/recipes/:id/show' do
        
	 end


	

end
