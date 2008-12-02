class WebsiteUse < ActiveRecord::Base
  belongs_to :website
  belongs_to :target, :polymorphic => true
end
