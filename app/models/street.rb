class Street < ActiveRecord::Base
  belongs_to :city
  has_many :addresses
  
  has_many :details, :as => :target
  has_many :parties, :as => :target
  has_many :rendezvouzs, :as => :target
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :visits, :as => :target
  has_many :visiting_guests, :through => :visits, :source => :guests
  has_many :rendezvouz_guests, :through => :rendezvouzs, :source => :guests
  has_many :party_guests, :through => :parties, :source => :guests
  
  def guests
    visiting_guests + rendezvouz_guests + party_guests
  end
end
