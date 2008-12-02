class Email < ActiveRecord::Base
  has_many :email_uses
  
  has_many :details, :as => :target
  has_many :website_uses, :as => :target
end
