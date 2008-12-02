class Call < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ person phone phone_use establishment ]
    when :capitalized
      %w[ Person Phone PhoneUse Establishment ]
    end
  end
end
