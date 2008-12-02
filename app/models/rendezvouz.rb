class Rendezvouz < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ address address_use establishment unit ]
    when :capitalized
      %w[ Address AddressUse Establishment Unit ]
    end
  end
end
