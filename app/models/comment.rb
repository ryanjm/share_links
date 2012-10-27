class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :web_link
  attr_accessible :body
end
