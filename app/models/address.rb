class Address < ActiveRecord::Base
  has_many :address_uses
  belongs_to :street
  belongs_to :zip
  has_many :units
  
  has_many :details, :as => :target
  has_many :parties, :as => :target
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  has_many :rendezvouzs, :as => :target
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :visits, :as => :target
  has_many :visiting_guests, :through => :visits, :source => :guests
  has_many :rendezvouz_guests, :through => :rendezvouzs, :source => :guests
  has_many :party_guests, :through => :parties, :source => :guests
  
  group_targets_of 'address_uses'
  
  def guests
    visiting_guests + rendezvouz_guests + party_guests
  end
  
  def name
    "#{street_number} #{street.name}"
  end
end
