class WebLink < ActiveRecord::Base
  attr_accessible :url

  has_many :archive_links
  has_many :comments

  scope :archived, lambda { where(:archived => true) }
  
  def self.open_for(user)
    WebLink.joins("LEFT OUTER JOIN archive_links ON archive_links.web_link_id = web_links.id AND archive_links.user_id = #{user.id}").where("web_links.archived = ? AND archive_links.id IS NULL",false)
  end

  def all_archived?
    self.archive_links.length == User.count
  end

  def archive!
    self.update_attribute(:archived, true)
  end

  def archive(user)
    if self.archive_links.where(user_id: user.id).length == 0
      a = self.archive_links.create
      a.update_attribute(:user, user)
      
      self.archive! if all_archived?
    end
  end

  def title
    "n/a"
  end
end
