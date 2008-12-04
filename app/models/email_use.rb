class EmailUse < ActiveRecord::Base
  belongs_to :email
  belongs_to :target, :polymorphic => true
  
  def self.target_list
    %w[ person establishment city state ]
  end
  
  scope_targets
  
  def name
    "#{target.name} at #{email.name}"
  end
end
