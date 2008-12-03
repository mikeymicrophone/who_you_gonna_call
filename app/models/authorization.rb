class Authorization < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :user
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ person phone detail ]
    when :symbol
      targets.map &:to_sym
    when :capitalized
      %w[ Person Phone Detail ]
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  scope_targets
  
  def name
    "#{user.name} a: #{target.name}"
  end
end
