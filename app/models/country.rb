class Country < ActiveRecord::Base
  has_many :states
  has_many :cities, :through => :states
  has_many :state_zips, :through => :states, :source => :zips
  has_many :city_zips, :through => :cities, :source => :zips
  
  has_many :details, :as => :target
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :visits, :as => :target
  has_many :guests, :through => :visits
  
  def zips
    city_zips + state_zips
  end
end
