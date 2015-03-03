class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_cache_buster  
  helper_method :current_user

  
  private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end 

  def disable_nav
    @disable_nav = true
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
  end

  def require_login
    unless session[:user_id]
     flash[:error] = "You must be logged in to access this section"
     redirect_to root_path 
   end
 end
end
