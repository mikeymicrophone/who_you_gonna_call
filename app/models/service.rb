class Service < ActiveRecord::Base
  has_many :aliases
  has_many :messages
  
  has_many :address_uses, :as => :target
  has_many :details, :as => :target
  has_many :phone_uses, :as => :target
  has_many :website_uses, :as => :target
end
