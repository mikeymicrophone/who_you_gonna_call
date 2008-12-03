class Party < ActiveRecord::Base
  has_many :guests, :as => :target
  belongs_to :target, :polymorphic => true
  
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses
  has_many :units, :through => :address_uses
  has_many :details, :as => :target
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ address address_use establishment street unit ]
    when :symbol
      targets.map &:to_sym
    when :capitalized
      %w[ Address AddressUse Establishment Street Unit ]
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  scope_targets
  
  def name
    "party #{time.strftime("%A %d")} at #{target.name}"
  end
end
