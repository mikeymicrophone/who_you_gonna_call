class Visit < ActiveRecord::Base
  has_many :guests, :as => :target
  belongs_to :target, :polymorphic => true

  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ address address_use city country establishment person state street unit ]
    when :capitalized
      %w[ Address AddressUse City Country Establishment Person State Street Unit ]
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  def name
    "visit: #{target.name}"
  end
end
