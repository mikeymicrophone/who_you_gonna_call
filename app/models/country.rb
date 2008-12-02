class Country < ActiveRecord::Base
  has_many :states
  
  has_many :details, :as => :target
  has_many :website_uses, :as => :target
  has_many :visits, :as => :target
end
