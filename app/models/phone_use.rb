class PhoneUse < ActiveRecord::Base
  belongs_to :phone
  belongs_to :target, :polymorphic => true
  has_many :calls, :as => :target
  has_many :details, :as => :target
  
  def self.target_list
    %w[ person establishment website city service unit address address_use website_use ]
  end
  
  scope_targets
  
  def name
    "#{target.name}: #{phone.name}"
  end
end
