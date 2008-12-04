class Rendezvouz < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses
  has_many :units, :through => :address_uses
  has_many :details, :as => :target
  has_many :guests, :as => :target
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  
  def self.target_list
    %w[ address address_use establishment unit street ]
  end
  
  scope_targets
  
  def name
    "rendezvouz: #{time.strftime("%A")} at #{target.name}"
  end
end
