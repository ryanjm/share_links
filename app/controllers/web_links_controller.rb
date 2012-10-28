class WebLinksController < ApplicationController
  before_filter :set_current_user

  def index
    @links = WebLink.open_for(@user)
  end

  def show
    @link = WebLink.find(params[:id])
    @comment = Comment.new
  end

end
