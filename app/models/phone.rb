class Phone < ActiveRecord::Base
  has_many :phone_uses
  has_many :phone_use_calls, :through => :phone_uses, :source => :calls
  has_many :phone_calls, :as => :target, :class_name => 'Call'
  
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses
  has_many :authorizations, :as => :target
  has_many :details, :as => :target
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  
  group_targets_of 'phone_uses'
  
  def calls
    phone_use_calls + phone_calls
  end
  
  def other_name
    "#{area_code} #{number}"
  end
end
