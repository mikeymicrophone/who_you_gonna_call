class EmailUse < ActiveRecord::Base
  belongs_to :email
  belongs_to :target, :polymorphic => true
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ person establishment city state ]
    when :capitalized
      %w[ Person Establishment City State ]
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  def name
    "#{target.name} at #{email.name}"
  end
end
