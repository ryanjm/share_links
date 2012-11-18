class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  # Checks for current_user_id inside the session
  # if it is there then it sets @user, otherwise redirects
  def set_current_user
    if session[:current_user_id]
      @user = User.find(session[:current_user_id])
    else
      redirect_to root_url
    end
  end
end
