class Service < ActiveRecord::Base
  has_many :aliases
  has_many :alias_uses, :through => :aliases
  has_many :messages
  
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses
  has_many :units, :through => :address_uses
  has_many :details, :as => :target
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
  
  def people
    alias_uses.person.map &:target
  end
end
