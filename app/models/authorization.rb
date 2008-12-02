class Authorization < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :user
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ person phone detail ]
    when :capitalized
      %w[ Person Phone Detail ]
    end
  end
end
