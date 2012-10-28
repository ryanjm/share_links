class SessionsController < ApplicationController

  def create
    session[:current_user_id] = params[:user_id]
    redirect_to web_links_path
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url
  end
end
