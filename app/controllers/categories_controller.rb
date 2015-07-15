class CategoriesController < ApplicationController

	def create
		category = Category.new
    category.update(category_params)
    redirect_to "/admin"
	end

	def update
		category = Category.find(params[:id])
    category.update(category_params)
    redirect_to "/admin"
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