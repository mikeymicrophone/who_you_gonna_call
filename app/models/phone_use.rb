class PhoneUse < ActiveRecord::Base
  belongs_to :phone
  belongs_to :target, :polymorphic => true
  has_many :calls, :as => :target
  has_many :details, :as => :target
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %[ person establishment website city service unit address address_use website_use ]
    when :capitalized
      %[ Person Establishment Website City Service Unit Address AddressUse WebsiteUse ]
    end
  end
end
