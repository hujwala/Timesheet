class UsersController < ApplicationController

  def index
  end

  def check_email
    @user = User.find_by_email(params[:user][:email])

    respond_to do |format|
      format.json { render :json => !@user  }
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.js{}
    end
  end

  def create

    @user = User.new(user_params)
    if @user.valid? && @user.errors.blank?
      @user.save
      @success = true
    else
      @success = false
    end
    respond_to do |format|
      format.html{ redirect_to @user }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end