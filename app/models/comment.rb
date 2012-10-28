class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :web_link
  attr_accessible :body
  
  after_create :remove_archives


  private

  def remove_archives
    self.web_link.archive_links.each { |l| l.destroy }
    self.web_link.update_attribute(:archived, false)
  end
end
