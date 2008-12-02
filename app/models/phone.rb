class Phone < ActiveRecord::Base
  has_many :phone_uses
  has_many :calls, :as => :target
  
  has_many :address_uses, :as => :target
  has_many :authorizations, :as => :target
  has_many :calls, :as => :target
  has_many :details, :as => :target
  has_many :website_uses, :as => :target
  
  def other_name
    "#{area_code} #{number}"
  end
end
