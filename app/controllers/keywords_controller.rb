class KeywordsController < ApplicationController

	require 'json'

	def create
		@keyword = Keyword.new
		keyword.update(keyword_params)
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
		@keyword.destroy
		#need to delete from join table first
		render json: @keyword.to_json
	end

	private

	def keyword_params
		params.require(:keyword).permit(:phrase)
	end

end