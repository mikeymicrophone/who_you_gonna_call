class Person < ActiveRecord::Base
  has_many :phone_uses, :as => :target
  has_many :phones, :through => :phone_uses
  has_many :email_uses, :as => :target
  has_many :emails, :through => :email_uses
  has_many :address_uses, :as => :target
  has_many :addresses, :through => :address_uses
  has_many :website_uses, :as => :target
  has_many :websites, :through => :website_uses
end
