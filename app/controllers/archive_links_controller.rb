class ArchiveLinksController < ApplicationController
  before_filter :set_current_user

  def create
    link = WebLink.find(params[:web_link_id])
    link.archive(@user)

    redirect_to link
  end
end
