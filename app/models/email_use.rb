class EmailUse < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
end
