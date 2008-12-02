class AddressUse < ActiveRecord::Base
  belongs_to :address
  belongs_to :unit
  belongs_to :target, :polymorphic => true
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ establishment party person phone rendezvouz service website ]
    when :capitalized
      %w[ Establishment Party Person Phone Rendezvouz Service Website ]
    end
  end
end
