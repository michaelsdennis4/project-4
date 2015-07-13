class UsersController < ApplicationController

	before_action :authorize, except: [:create, :new]

end