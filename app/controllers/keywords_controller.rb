class KeywordsController < ApplicationController

	require 'json'

	def create
		@keyword = Keyword.new
		@keyword[:phrase] = params[:phrase]
		@keyword[:sequence] = Keyword.all.count + 1
		@keyword.save
    render json: @keyword.to_json
	end

	def update
		@keyword = Keyword.find(params[:id])
		if (params[:phrase])
			@keyword.update({phrase: params[:phrase]})
		end
		if (params[:sequence])
			@keyword.update({sequence: params[:sequence]})
		end
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