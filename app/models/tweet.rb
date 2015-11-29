class Tweet < ActiveRecord::Base
  validates :account_id, :presence => true
  validates :text, :presence => true, :length => { :in => 1..140 }
end
