class HomeController < ApplicationController
  # Want to move the user to the weblinks index if they are signed in
  before_filter :redirect_user, except: [:style_guide]

  def index
    @users = User.all
  end

  def style_guide
    render :laout => :none
  end

  private

  def redirect_user
    redirect_to web_links_path if session[:current_user_id]
  end
end
