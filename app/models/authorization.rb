class Authorization < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :user
  
  def self.target_list
    %w[ person phone detail ]
  end
  
  scope_targets
  
  def name
    "#{user.name} a: #{target.name}"
  end
end
