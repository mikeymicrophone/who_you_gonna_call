class Party < ActiveRecord::Base
  has_many :guests, :as => :target
  belongs_to :target, :polymorphic => true
  
  has_many :address_uses, :as => :target
  has_many :details, :as => :target
  has_many :guests, :as => :target
  has_many :website_uses, :as => :target
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ address address_use establishment street unit ]
    when :capitalized
      %w[ Address AddressUse Establishment Street Unit ]
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  def name
    "party #{time.strftime("%A %d")} at #{target.name}"
  end
end
