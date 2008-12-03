class PhoneUse < ActiveRecord::Base
  belongs_to :phone
  belongs_to :target, :polymorphic => true
  has_many :calls, :as => :target
  has_many :details, :as => :target
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ person establishment website city service unit address address_use website_use ]
    when :symbol
      targets.map &:to_sym
    when :capitalized
      %w[ Person Establishment Website City Service Unit Address AddressUse WebsiteUse ]
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  scope_targets
  
  def name
    "#{target.name}: #{phone.name}"
  end
end
