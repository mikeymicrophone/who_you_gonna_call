class AddressUse < ActiveRecord::Base
  belongs_to :address
  belongs_to :unit
  belongs_to :target, :polymorphic => true
  
  has_many :parties, :as => :target
  has_many :phone_uses, :as => :target
  has_many :rendezvouzs, :as => :target
  has_many :website_uses, :as => :target
  has_many :visits, :as => :target
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ establishment party person phone rendezvouz service website ]
    when :capitalized
      %w[ Establishment Party Person Phone Rendezvouz Service Website ]
    end
  end
end
