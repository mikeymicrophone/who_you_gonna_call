class Establishment < ActiveRecord::Base
  has_many :rendezvouzs, :as => :target
end
