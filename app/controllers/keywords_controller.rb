class KeywordsController < ApplicationController

	require 'json'

	def create
		@keyword = Keyword.new
		@keyword[:phrase] = params[:phrase]
		@keyword.save
    render json: @keyword.to_json
	end

	def update
		@keyword = Keyword.find(params[:id])
		@keyword[:phrase] = params[:phrase]
		@keyword.save
  	render json: @keyword.to_json
	end

	def destroy
		@keyword = Keyword.find(params[:id])
		@keyword.items.each do |item|
			@keyword.items.delete(item)
		end 
		@keyword.destroy
		render json: @keyword.to_json
	end

	private

	def keyword_params
		params.require(:keyword).permit(:phrase)
	end

end