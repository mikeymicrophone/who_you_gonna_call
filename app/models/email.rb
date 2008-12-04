class Email < ActiveRecord::Base
  has_many :email_uses
  
  has_many :details, :as => :target
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  
  group_targets_of 'email_uses'
  
  def name
    address
  end
end
