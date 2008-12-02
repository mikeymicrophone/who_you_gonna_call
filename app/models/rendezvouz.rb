class Rendezvouz < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
end
