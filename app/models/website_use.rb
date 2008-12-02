class WebsiteUse < ActiveRecord::Base
  belongs_to :website
  belongs_to :target, :polymorphic => true
  
  has_many :details, :as => :target
  has_many :phone_uses, :as => :target
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ address address_use alias city country detail email establishment message party person phone rendezvouz service state street unit ]
    when :capitalized
      %w[ Address AddressUse Alias City Country Detail Email Establishment Message Party Person Phone Rendezvouz Service State Street Unit ]
    when :select
      targets.zip targets(:capitalized)
    end
  end
  
  def name
    "#{website.name}~#{target.name}"
  end
end
