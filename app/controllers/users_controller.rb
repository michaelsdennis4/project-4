class UsersController < ApplicationController

	def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new
    if user.update(user_params)
      redirect_to "/users/#{user.id}"
    else
      redirect_to '/users/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])   
    user.update(user_params)
    redirect_to "/users/#{user.id}" 
  end

  def edit
    @user = User.find(params[:id]) 
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :active)
  end

end