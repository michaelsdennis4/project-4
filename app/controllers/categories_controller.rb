class CategoriesController < ApplicationController

	require 'json'

	def create
		@category = Category.new
    @category.update(params)
    render json: @category.to_json
	end

	def update
		@category = Category.find(params[:id])
    @category[:name] = params[:name]
    @category.save
    render json: @category.to_json
	end

	def delete
		category = Category.find(params[:id])
		#need to delete from join table first

	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

end