class Establishment < ActiveRecord::Base
  has_many :rendezvouzs, :as => :target
  has_many :visits, :as => :target
  has_many :parties, :as => :target
  
  has_many :address_uses, :as => :target
  has_many :calls, :as => :target
  has_many :details, :as => :target
  has_many :email_uses, :as => :target
  has_many :parties, :as => :target
  has_many :phone_uses, :as => :target
  has_many :rendezvouzs, :as => :target
  has_many :website_uses, :as => :target
  has_many :visits, :as => :target
end
