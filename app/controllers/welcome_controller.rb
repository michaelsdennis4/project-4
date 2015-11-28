class WelcomeController < ApplicationController

	def index
		@categories = Category.all.order(:sequence)
		@keywords = Keyword.all.order(:sequence)
	end

	def admin
		@items_count = Item.count
		@categories = Category.all.order(:sequence)
		@keywords = Keyword.all.order(:sequence)
		user = User.find(session[:user_id])
		@first_name = user.first_name
		@last_name = user.last_name
		@email = user.email
	end

end