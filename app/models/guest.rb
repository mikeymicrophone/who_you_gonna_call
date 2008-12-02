class Guest < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :person
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ rendezvouz visit party ]
    when :capitalized
      %w[ Rendezvouz Visit Party ]
    end
  end
end
