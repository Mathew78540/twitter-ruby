class Follow < ActiveRecord::Base

  validates :account_id, :presence => true
  validates :follower_id, :presence => true

  belongs_to :account_following, class_name: 'Account', foreign_key: 'account_id'
  belongs_to :account_follower, class_name: 'Account', foreign_key: 'follower_id'

  def self.following?(follower_id, account_id)
    Follow.where({:follower_id => follower_id, :account_id => account_id}).first
  end

end
