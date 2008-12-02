class Address < ActiveRecord::Base
  has_many :address_uses
  belongs_to :street
  belongs_to :zip
  
  has_many :details, :as => :target
  has_many :parties, :as => :target
  has_many :phone_uses, :as => :target
  has_many :rendezvouzs, :as => :target
  has_many :website_uses, :as => :target
  has_many :visits, :as => :target
end
