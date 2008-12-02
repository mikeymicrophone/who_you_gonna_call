class City < ActiveRecord::Base
  belongs_to :state
  has_many :streets
  has_many :zips
  has_many :addresses, :through => :streets
  
  has_many :details, :as => :target
  has_many :email_uses, :as => :target
  has_many :phone_uses, :as => :target
  has_many :website_uses, :as => :target
  has_many :visits, :as => :target
  
  def country
    state.country
  end
  
  def units
    addresses.map(&:units).flatten
  end
end
