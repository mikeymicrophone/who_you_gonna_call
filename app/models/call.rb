class Call < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  
  has_many :details, :as => :target
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ person phone phone_use establishment ]
    when :symbol
      targets.map &:to_sym
    when :capitalized
      %w[ Person Phone PhoneUse Establishment ]
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  scope_targets
  
  def name
    "call: #{target.name}"
  end
end
