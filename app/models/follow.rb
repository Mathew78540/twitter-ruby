class Follow < ActiveRecord::Base

  validates :account_id, :presence => true
  validates :follower_id, :presence => true

  def self.following?(follower_id, account_id)

    if Follow.where({:follower_id => follower_id, :account_id => account_id}).first
      return true
    end

    return false
  end

end
