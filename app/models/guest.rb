class Guest < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :person
  
  has_many :details, :as => :target
  
  def self.target_list
    %w[ rendezvouz visit party street ]
  end
  
  scope_targets
  
  def name
    "guest: #{person.name} at #{target.name}"
  end
end
