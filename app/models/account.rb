class Account < ActiveRecord::Base

  has_secure_password

  has_many :tweet
  has_many :likes
  has_many :following, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :follower, class_name: 'Follow', foreign_key: 'account_id'

  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :lastname, :firstname, :presence => true

end
