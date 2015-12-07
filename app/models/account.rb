class Account < ActiveRecord::Base

  has_secure_password

  attr_accessor :avatar

  mount_uploader :avatar, AvatarUploader

  has_many :tweet
  has_many :likes
  has_many :following, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :follower, class_name: 'Follow', foreign_key: 'account_id'

  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :lastname, :firstname, :presence => true

  # Search Methods
  def self.search(query)
    where("username LIKE :search OR lastname LIKE :search OR firstname LIKE :search", search: "%#{query}%")
  end

  # Get full name
  def get_fullname
    "#{self.firstname.capitalize} #{self.lastname.capitalize}"
  end

  # Get avatar Url
  def get_avatar
    if self.avatar.present?
      self.avatar
    else
      "https://sigil.cupcake.io/#{self.username}"
    end
  end

  # Get username
  def get_username
    "@#{self.username}"
  end

end
