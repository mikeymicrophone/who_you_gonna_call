class Message < ActiveRecord::Base
  belongs_to :service
  
  has_many :details, :as => :target
  has_many :website_uses, :as => :target
end
