class CategoriesController < ApplicationController

	require 'json'

	def create
		@category = Category.new
    @category[:name] = params[:name]
    @category.save
    render json: @category.to_json
	end

	def update
		@category = Category.find(params[:id])
    @category[:name] = params[:name]
    @category.save
    render json: @category.to_json
	end

	def destroy
		@category = Category.find(params[:id])
		#need to delete entries from join table first
		@category.destroy;
		render json: @category.to_json
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

end