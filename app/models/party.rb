class Party < ActiveRecord::Base
  has_many :guests, :as => :target
  belongs_to :target, :polymorphic => true
end
