class WebLink < ActiveRecord::Base
  attr_accessible :url, :title, :comments_attributes

  has_many :archive_links
  has_many :comments
  belongs_to :user

  # Rejects a comment if it doesn't have a body.
  accepts_nested_attributes_for :comments, reject_if: lambda { |c| c[:body].blank? }

  # Grab all weblines that are acthived.
  scope :archived, lambda { where(:archived => true) }
 
  validates :url, :presence => true 

  # A weblink only gets archived if everyone in the system
  # has archived them. This method checks for that.
  def all_archived?
    self.archive_links.length == User.count
  end

  # Helper method to archive weblink
  def archive!
    self.update_attribute(:archived, true)
  end

  # Archives an archive_link for a given user
  # A user can't do this twice
  def archive(user)
    if self.archive_links.where(user_id: user.id).length == 0
      a = self.archive_links.create
      a.update_attribute(:user, user)
      
      self.archive! if all_archived?
    end
  end
 
  # Checks to see if a link is archived by a given user
  def archived_by?(user)
    !self.archive_links.where(user_id: user.id).empty?
  end

  # Helper method to check attribute
  def archived?
    self.archived
  end
end
