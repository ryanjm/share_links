class User < ActiveRecord::Base
  attr_accessible :last_login, :name

  # archive_link objects that this user has created
  has_many :archive_links

  # Those weblinks which the user has archived.
  # This isn't currently used within the site.
  has_many :archived_web_links, through: :archive_links, source: :web_link, foreign_key: :web_link_id
  
  # Grab all the open links for a user.
  # This is an outer join in order to exclude 
  # archives performed by someone else. This is a very
  # complicated query.
  def open_links
    WebLink.where(archived: false).joins("LEFT OUTER JOIN archive_links ON archive_links.web_link_id = web_links.id AND archive_links.user_id = #{self.id}").where("archive_links.id IS NULL")
  end

end
