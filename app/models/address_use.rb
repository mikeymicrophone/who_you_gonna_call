class AddressUse < ActiveRecord::Base
  belongs_to :address
  belongs_to :target, :polymorphic => true
end
