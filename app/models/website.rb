class Website < ActiveRecord::Base
  has_many :website_uses
  
  has_many :address_uses, :as => :target
  has_many :details, :as => :target
  has_many :phone_uses, :as => :target
end
