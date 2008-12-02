class Detail < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
end
