class Visit < ActiveRecord::Base
  has_many :guests, :as => :target
  belongs_to :target, :polymorphic => true

  def self.target_list
    %w[ address address_use city country establishment person state street unit ]
  end
  
  scope_targets
  
  def name
    "visit: #{target.name}"
  end
end
