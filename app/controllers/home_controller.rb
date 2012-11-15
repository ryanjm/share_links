class HomeController < ApplicationController
  before_filter :redirect_user, except: [:style_guide]

  def index
    @users = User.all
  end

  def style_guide
    render :laout => :none
  end

  private

  def redirect_user
    if session[:current_user_id]
      redirect_to web_links_path
    end
  end
end
