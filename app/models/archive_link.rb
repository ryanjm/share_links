class ArchiveLink < ActiveRecord::Base
  belongs_to :user
  belongs_to :web_link
end
