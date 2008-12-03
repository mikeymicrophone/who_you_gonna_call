class Guest < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :person
  
  has_many :details, :as => :target
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ rendezvouz visit party ]
    when :symbol
      targets.map &:to_sym
    when :capitalized
      %w[ Rendezvouz Visit Party ]
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  scope_targets
  
  def name
    "guest: #{person.name} at #{target.name}"
  end
end
