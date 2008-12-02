class Alias < ActiveRecord::Base
  has_many :alias_uses
  belongs_to :service
  
  has_many :details, :as => :target
  has_many :website_uses, :as => :target
end
