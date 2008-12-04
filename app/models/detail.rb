class Detail < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  
  has_many :authorizations, :as => :target
  has_many :users, :through => :authorizations
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  
  def self.target_list
    %w[ address alias call city country email establishment guest message party person phone phone_use rendezvouz service state street txt unit user website website_use ]
  end
  
  scope_targets
  
  def name
    content[0..200]
  end
end
