class Like < ActiveRecord::Base

  belongs_to :tweet

  validates :account_id, :presence => true
  validates :tweet_id, :presence => true
  
end
