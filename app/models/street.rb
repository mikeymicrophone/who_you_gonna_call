class Street < ActiveRecord::Base
  belongs_to :city
  has_many :addresses
  
  has_many :details, :as => :target
  has_many :parties, :as => :target
  has_many :rendezvouzs, :as => :target
  has_many :website_uses, :as => :target
  has_many :visits, :as => :target
end
