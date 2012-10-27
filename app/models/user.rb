class User < ActiveRecord::Base
  attr_accessible :last_login, :name
end
