class WelcomeController < ApplicationController

	def index
		@categories = Category.all.order(:name)
		@keywords = Keyword.all.order(:phrase)
	end

	def admin
		@categories = Category.all.order(:name)
		@keywords = Keyword.all.order(:phrase)
	end

end