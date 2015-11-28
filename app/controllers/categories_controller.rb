class CategoriesController < ApplicationController

	require 'json'

	def create
		@category = Category.new
    @category[:name] = params[:name]
    @category[:sequence] = Category.all.count + 1
    @category.save
    render json: @category.to_json
	end

	def update
		@category = Category.find(params[:id])
		if (params[:name])
    	@category.update({name: params[:name]})
    end
    if (params[:sequence])
    	@category.update({sequence: params[:sequence]})
    end
    render json: @category.to_json
	end

	def destroy
		@category = Category.find(params[:id])
		@category.items.each do |item|
			@category.items.delete(item)
		end
		@category.destroy;
		render json: @category.to_json
	end

	private

	def category_params
		params.require(:category).permit(:name, :sequence)
	end

end