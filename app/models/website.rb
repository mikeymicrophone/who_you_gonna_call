class Website < ActiveRecord::Base
  has_many :website_uses

  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses
  has_many :details, :as => :target
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  
  group_targets_of 'website_uses'
  
  def other_name
    href
  end
end
