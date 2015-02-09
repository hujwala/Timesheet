class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    respond_to do |format|
      format.js{}
    end
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to  sessions_path, :success => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path, :success => "Logged out!"
  end
  
end