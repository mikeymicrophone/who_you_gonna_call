class City < ActiveRecord::Base
  belongs_to :state
  has_one :country, :through => :state
  has_many :streets
  has_many :zips
  has_many :addresses, :through => :streets
  
  has_many :details, :as => :target
  has_many :email_uses, :as => :target
  has_many :emails, :through => :email_uses
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :visits, :as => :target
  has_many :guests, :through => :visits
  
  def units
    addresses.map(&:units).flatten
  end
end
