class Party < ActiveRecord::Base
  has_many :guests, :as => :target
  belongs_to :target, :polymorphic => true
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ address address_use establishment street unit ]
    when :capitalized
      %w[ Address AddressUse Establishment Street Unit ]
    end
  end
end
