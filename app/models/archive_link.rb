class ArchiveLink < ActiveRecord::Base
  belongs_to :user
  belongs_to :web_link
  # attr_accessible :title, :body
end
