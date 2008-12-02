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
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  def name
    "rendezvouz: #{time.strftime("%A")} at #{target.name}"
  end
end
