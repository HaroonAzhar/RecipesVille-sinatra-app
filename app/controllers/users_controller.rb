class UserController < ApplicationController
	

	

	private
	def find_model
		@model = User.find(params[:id]) if params[:id]
	end
end

