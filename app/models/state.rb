class State < ActiveRecord::Base
  has_many :cities
  belongs_to :country
  has_many :streets, :through => :cities
  
  has_many :details, :as => :target
  has_many :email_uses, :as => :target
  has_many :website_uses, :as => :target
  has_many :visits, :as => :target
end
