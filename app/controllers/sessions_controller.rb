class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    respond_to do |format|
      format.js{}
    end
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to  timesheet_index_path
      flash[:success] = "You have Logged in successfully!"
    else
      flash.now.alert = "Invalid email or password"
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user
     session[:user_id] = nil
     redirect_to root_path, :success => "Logged out!"
   else
    redirect_to root_path, :message => "Logged out!"
  end
end
end
