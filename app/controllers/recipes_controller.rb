class RecipeController < ApplicationController
	

	

	private
	def find_model
		@model = Recipe.find(params[:id]) if params[:id]
	end
end
