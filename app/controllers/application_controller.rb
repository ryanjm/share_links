class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def set_current_user
    if session[:current_user_id]
      @user = User.find(session[:current_user_id])
    else
      redirect_to :root_url
    end
  end
end
