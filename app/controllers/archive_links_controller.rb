class ArchiveLinksController < ApplicationController
  before_filter :set_current_user

  # Not handling any error cases here
  def create
    link = WebLink.find(params[:web_link_id])
    link.archive(@user)

    if params[:archive_link]["redirect_to"] == 'index'
      redirect_to web_links_path
    else
      redirect_to link
    end
  end
end
