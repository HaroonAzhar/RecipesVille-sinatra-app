class IngredientController < ApplicationController
	

	

	private
	def find_model
		@model = Ingredient.find(params[:id]) if params[:id]
	end
end
