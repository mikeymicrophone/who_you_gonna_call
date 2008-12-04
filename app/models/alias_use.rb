class AliasUse < ActiveRecord::Base
  belongs_to :alia, :class_name => 'Alias', :foreign_key => :alias_id
  belongs_to :target, :polymorphic => true
    
  def self.target_list
    %w[ person establishment ]
  end
  
  scope_targets
  
  def name
    "#{person.name} is #{alia.name}@#{alia.service.name}"
  end
end
