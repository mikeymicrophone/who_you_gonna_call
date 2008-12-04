class WebsiteUse < ActiveRecord::Base
  belongs_to :website
  belongs_to :target, :polymorphic => true
  
  has_many :details, :as => :target
  has_many :phone_uses, :as => :target
  
  def self.target_list
    %w[ address address_use alias city country detail email establishment message party person phone rendezvouz service state street unit ]
  end
  
  scope_targets
  
  def name
    "#{website.name}~#{target.name}"
  end
end
