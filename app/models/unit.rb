class Unit < ActiveRecord::Base
  belongs_to :address
  has_many :address_uses
  
  has_many :details, :as => :target
  has_many :parties, :as => :target
  has_many :phone_uses, :as => :target
  has_many :rendezvouzs, :as => :target
  has_many :website_uses, :as => :target
  has_many :visits, :as => :target
  
  def name
    number
  end
end
