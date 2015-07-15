class KeywordsController < ApplicationController

	def create
		keyword = Keyword.new
    keyword.update(keyword_params)
    redirect_to "/admin"
	end

	def update
		keyword = Keyword.find(params[:id])
    keyword.update(keyword_params)
    redirect_to "/admin"
	end

	def delete
		keyword = Keyword.find(params[:id])
		#need to delete from join table first

	end

	private

	def keyword_params
		params.require(:keyword).permit(:phrase)
	end

end