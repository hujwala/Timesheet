class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    respond_to do |format|
      format.js{}
    end
  end

  def create
   if params[:provider] == "linkedin"
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)

  else
    user = User.authenticate(params[:email], params[:password])
  end
  if user
    session[:user_id] = user.id
    redirect_to  timesheet_index_path  
    flash[:alert] = "you are successfully logged in " 
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
