class AliasUse < ActiveRecord::Base
  belongs_to :alia, :class_name => 'Alias'
  belongs_to :target, :polymorphic => true
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ person establishment ]
    when :capitalized
      %w[ Person Establishment ]
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  def name
    "#{person.name} is #{alia.name}@#{alia.service.name}"
  end
end
