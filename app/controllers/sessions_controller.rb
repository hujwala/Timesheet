class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    respond_to do |format|
      format.js{}
    end
  end

  
    def create
    if params[:provider] == "linkedin"
      auth = User.from_omniauth(env["omniauth.auth"])
      @user = User.find_by_provider_and_uid(auth["provider"],
        auth["uid"]) || User.create_with_omniauth(auth)
    else
      @user = User.find_by_email(params[:user][:email])
    end
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to  timesheet_index_path
      flash[:success] = "You have logged in successfullly!"
    else
      flash[:error] = "Invalid email or password"
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
