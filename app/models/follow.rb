class Follow < ActiveRecord::Base

  validates :account_id, :presence => true
  validates :follower_id, :presence => true

end
