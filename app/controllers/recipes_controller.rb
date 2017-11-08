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

	 erb :"/recipes/show"
	 end

	 get '/recipes/:id/show' do

	 	@recipe=Recipe.find_by(id: params[:id])
	 	erb :'/recipes/show'
        
	 end


	 get '/recipes/:id/edit' do 
	 	@recipe= Recipe.find_by(id: params[:id])
	 	erb :'/recipes/edit'
	 end

	 patch '/recipes/:id/update' do
	 			#create action almost repeats here

	 	 user=current_user
	 	 @recipe=Recipe.find_by(id: params[:id])
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

	     erb :'/recipes/show'

	 end


	

end
