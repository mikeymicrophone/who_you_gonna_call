class Rendezvouz < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  
  has_many :address_uses, :as => :target
  has_many :details, :as => :target
  has_many :guests, :as => :target
  has_many :website_uses, :as => :target
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ address address_use establishment unit street ]
    when :capitalized
      %w[ Address AddressUse Establishment Unit Street ]
    end
  end
end
