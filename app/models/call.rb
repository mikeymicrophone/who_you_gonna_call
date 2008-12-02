class Call < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
end
