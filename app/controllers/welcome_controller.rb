class WelcomeController < ApplicationController

	def index
		@categories = Category.all
		@keywords = Keyword.all
	end

	def admin
		@categories = Category.all
		@keywords = Keyword.all
	end

end