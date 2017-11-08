class IngredientController < ApplicationController
	  require 'pry'
   get '/ingredients/new' do
     erb :'/ingredients/new' 
   end

   post '/ingredients/create' do 
       
       @ingred= Ingredient.find_or_create_by(name: params[:name])
       @ingred.info= params[:info]
       @ingred.save
      erb :'/ingredients/show' 
   end


   get '/ingredients/:id/show' do
    @ingred=Ingredient.find_by(ingredient_id: params[:id])
 
  
    erb :'/ingredients/show'
   end 

    get '/ingredients' do
       @ingred=Ingredient.all
       erb :'/ingredients/index'
    end


    get '/Ingredients/:id/edit' do
      @ingred=Ingredient.find_by(id: params[:id])
      erb :'/ingredients/edit'
    end

    patch '/ingredients/:id' do
      @ingred=Ingredient.find_by(id: params[:id])
      @ingred.info= params[:info]
      @ingred.name=params[:name]
      @ingred.save
      erb :'/ingredients/show' 
      
    end

    


	

	
end
