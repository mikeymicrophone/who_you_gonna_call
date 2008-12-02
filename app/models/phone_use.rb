class PhoneUse < ActiveRecord::Base
  belongs_to :phone
  belongs_to :target, :polymorphic => true
end
