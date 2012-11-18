class CommentsController < ApplicationController
  before_filter :set_current_user

  def create
    @link = WebLink.find(params[:web_link_id])
    # building the comment through the link so we don't
    # have to have link_id attribute accessible
    @comment = @link.comments.build(params[:comment])
    @comment.user = @user
    if @comment.save
      redirect_to @link
    else
      flash[:error] = "There was an error saving the comment, please try again"
      # need an archive_link to render the page
      @archive_link = ArchiveLink.new
      render 'web_links/show'
    end
  end
end
