class UsersController < ApplicationController

  require 'json'

	def index
    @users = User.all.order("is_admin DESC").order(:last_name).order(:first_name)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id]) 
  end

  def create
    user = User.new
    if user.update(user_params)
      redirect_to "/users"
    else
      redirect_to '/users/new'
    end
  end

  def update
    @user = User.find(params[:id])  
    @user[:first_name] = params[:user][:first_name]
    @user[:last_name] = params[:user][:last_name]
    @user[:email] = params[:user][:email]
    @user[:is_admin] = params[:user][:is_admin]
    @user[:is_active] = params[:user][:is_active]
    @user.save
    render json: @user.to_json
  end

  def change_pw
    user = User.find_by({email: params[:user][:email]})
    @message = 'ERROR: Password NOT changed!'
    if (user && user.authenticate(params[:user][:password]))
      if (!params[:user][:new_password].nil? && !params[:user][:new_password].empty?)
        user.password = params[:user][:new_password] unless 
        user.save
        @message = 'Password changed successfully!'
      end
    end
    render json: @message.to_json
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :is_admin, :is_active)
  end

end