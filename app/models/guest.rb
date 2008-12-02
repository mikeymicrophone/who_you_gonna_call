class Guest < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :person
  
  has_many :details, :as => :target
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ rendezvouz visit party ]
    when :capitalized
      %w[ Rendezvouz Visit Party ]
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  def name
    "guest: #{person.name} at #{target.name}"
  end
end
