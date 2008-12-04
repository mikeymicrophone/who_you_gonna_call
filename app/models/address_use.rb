class AddressUse < ActiveRecord::Base
  belongs_to :address
  belongs_to :unit
  belongs_to :target, :polymorphic => true
  
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
  
  def guests
    visiting_guests + rendezvouz_guests + party_guests
  end
    
  def self.target_list
    %w[ establishment party person phone rendezvouz service website ]
  end
  
  scope_targets
  
  def location
    unit || address
  end
  
  def name
    "#{spot.name}~#{target.name}"
  end
end
