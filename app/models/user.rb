class User < ActiveRecord::Base
  has_many :favourite_statuses
end
