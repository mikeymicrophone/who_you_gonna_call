class EmailUse < ActiveRecord::Base
  belongs_to :email
  belongs_to :target, :polymorphic => true
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ person establishment city state ]
    when :symbol
      targets.map &:to_sym
    when :capitalized
      %w[ Person Establishment City State ]
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  scope_targets
  
  def name
    "#{target.name} at #{email.name}"
  end
end
