class SessionsController < ApplicationController

	#renders the login form
  def new 
  end

  #creates a session
  def create
    user = User.find_by({email: params[:email]})
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = "#{user.first_name} #{user.last_name}"
      session[:is_admin] = user.is_admin
      redirect_to "/" #dashboard
    else
      # rerender the form
      redirect_to '/login'
    end
  end

  #nulls user session (logout)
  def destroy
  	session[:user_id] = nil
    session[:user_name] = nil
    session[:is_admin] = nil
  	redirect_to '/'
  end

end