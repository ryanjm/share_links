class WebLinksController < ApplicationController
  before_filter :set_current_user

  def index
    @links = WebLink.open_for(@user)
    @link = WebLink.new
    @link.comments.build
  end

  def show
    @link = WebLink.find(params[:id])
    @comment = Comment.new
    @archive_link = ArchiveLink.new
  end

  def create
    @link = WebLink.new(params[:web_link])
    @link.comments.first.user = @user unless @link.comments.empty?
    @link.user = @user
    if @link.save
      redirect_to @link
    else
      flash[:error] = "Couldn't save"
      render 'index' # index has the form for a new web link
    end
  end

  def destroy
    link = WebLink.find(params[:id])
    link.destroy
    redirect_to web_links_path
  end

  def archived
    @links = WebLink.archived
  end

end
