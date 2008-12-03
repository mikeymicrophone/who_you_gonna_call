class Establishment < ActiveRecord::Base
  has_many :rendezvouzs, :as => :target
  has_many :visits, :as => :target
  has_many :parties, :as => :target
  
  has_many :party_guests, :through => :parties, :source => :guests
  has_many :visiting_guests, :through => :visits, :source => :guests
  has_many :rendezvouz_guests, :through => :rendezvouzs, :source => :guests
  
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses
  has_many :calls, :as => :target
  has_many :details, :as => :target
  has_many :email_uses, :as => :target
  has_many :emails, :through => :email_uses
  has_many :alias_uses, :as => :target
  has_many :alises, :through => :alias_uses
  has_many :parties, :as => :target
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  has_many :rendezvouzs, :as => :target
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  has_many :visits, :as => :target
end
