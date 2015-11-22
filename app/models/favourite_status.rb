class FavouriteStatus < ActiveRecord::Base
  paginates_per 10
  
  belongs_to :user

  validates :user, :status, presence: true
  validates :member_id, uniqueness: { scope: :user_id }
end
