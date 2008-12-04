class Call < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  
  has_many :details, :as => :target
  
  def self.target_list
    %w[ person phone phone_use establishment ]
  end
  
  scope_targets
  
  def name
    "call: #{target.name}"
  end
end
