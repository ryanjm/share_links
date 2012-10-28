class CommentsController < ApplicationController
  before_filter :set_current_user

  def create
    link = WebLink.find(params[:web_link_id])
    comment = link.comments.build(params[:comment])
    comment.user = @user
    if comment.save
      redirect_to link
    else
      flash[:error] = "There was an error saving the comment, please try again"
      redirect_to link
    end
  end
end
