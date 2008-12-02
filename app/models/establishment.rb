class Establishment < ActiveRecord::Base
  has_many :rendezvouzs, :as => :target
  has_many :visits, :as => :target
  has_many :parties, :as => :target
end
