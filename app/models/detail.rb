class Detail < ActiveRecord::Base
  belongs_to :target, :polymorphic => true
  
  has_many :authorizations, :as => :target
  has_many :website_uses, :as => :target
  
  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ address alias call city country email establishment guest message party person phone phone_use rendezvouz service state street txt unit user website website_use ]
    when :capitalized
      %w[ Address Alias Call City Country Email Establishment Guest Message Party Person Phone Phone_use Rendezvouz Service State Street Txt Unit User Website WebsiteUse ]
    end
  end
end
