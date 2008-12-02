class Guest < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  belongs_to :person
end
