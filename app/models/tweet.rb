class Tweet < ActiveRecord::Base

  belongs_to :account
  has_many :likes

  validates :account_id, :presence => true
  validates :text, :presence => true, :length => { :in => 1..140 }
end
