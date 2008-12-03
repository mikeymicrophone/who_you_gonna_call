class State < ActiveRecord::Base
  has_many :cities
  has_many :zips
  belongs_to :country
  has_many :streets, :through => :cities
  
  has_many :details, :as => :target
  has_many :email_uses, :as => :target
  has_many :emails, :through => :email_uses
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :visits, :as => :target
  has_many :guests, :through => :visits
end
