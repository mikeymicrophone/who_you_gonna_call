class EmailUse < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ person establishment city state ]
    when :capitalized
      %w[ Person Establishment City State ]
    end
  end
end
