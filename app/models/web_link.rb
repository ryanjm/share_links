class WebLink < ActiveRecord::Base
  attr_accessible :url

  has_many :archives

  def archive(user)

  end
end
