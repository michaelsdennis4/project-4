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
    # user.update(user_params) 
    @user.first_name = params["first_name"]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.is_admin = params[:is_admin]
    @user.is_active = params[:is_active]
    @user.save
    render json: @user.to_json
    # redirect_to "/users/#{user.id}/edit"
  end

  def change_pw
    user = User.find_by({email: params[:user][:email]})
    if (user && user.authenticate(params[:password]))
      if user.valid?
        user.password = params[:user][:new_password] unless params[:user][:new_password].nil? || params[:user][:new_password].empty?
        user.save
        @message = 'Password changed successfully!'
      else 
       @message = 'ERROR: Password NOT changed!' 
      end
    else
      @message = 'ERROR: Password NOT changed!' 
    end
    if (user)
      @user = user
      render "edit.html.erb"
      # redirect_to "/users/#{user.id}/edit"
    else
      redirect_to "/users"
    end
    # render json: @message.to_json 
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :is_admin, :is_active)
  end

end