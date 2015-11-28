class Account < ActiveRecord::Base

  has_secure_password
  
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :lastname, :firstname, :presence => true
  validates :password, :confirmation => true
  validates_length_of :password, :in => 6..20, :on => :create



end
