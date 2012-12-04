class WebLinksController < ApplicationController
  before_filter :set_current_user

  def index
    @links = @user.open_links
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
    # If a comment was created with link, then we want to set
    # the user of the comment (since it isn't attribute accessible)
    @link.comments.first.user = @user unless @link.comments.empty?
    @link.user = @user
    if @link.save
      redirect_to web_links_path
    else
      flash[:error] = "Couldn't save"
      # need to set the same variables that index does so the 
      # view can render.
      @links = @user.open_links
      @link.comments.build if @link.comments.empty?
      render :index # index has the form for a new web link
    end
  end

  def destroy
    link = WebLink.find(params[:id])
    link.destroy
    redirect_to web_links_path
  end

  def archived
    @links = WebLink.archived
    @user_archived = @user.archived_web_links.where(archived: false)
  end

end
