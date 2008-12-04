class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :details, :as => :target
  has_many :identities, :class_name => 'Person'
  
  has_many :addresses, :foreign_key => :creator_id
  has_many :address_uses, :foreign_key => :creator_id
  has_many :aliases, :foreign_key => :creator_id
  has_many :alias_uses, :foreign_key => :creator_id
  has_many :granted_authorizations, :foreign_key => :creator_id, :class_name => 'Authorizations'
  has_many :calls, :foreign_key => :creator_id
  has_many :cities, :foreign_key => :creator_id
  has_many :countries, :foreign_key => :creator_id
  has_many :details, :foreign_key => :creator_id
  has_many :emails, :foreign_key => :creator_id
  has_many :email_uses, :foreign_key => :creator_id
  has_many :establishments, :foreign_key => :creator_id
  has_many :guests, :foreign_key => :creator_id
  has_many :messages, :foreign_key => :creator_id
  has_many :parties, :foreign_key => :creator_id
  has_many :people, :foreign_key => :creator_id
  has_many :phones, :foreign_key => :creator_id
  has_many :phone_uses, :foreign_key => :creator_id
  has_many :rendezvouzs, :foreign_key => :creator_id
  has_many :services, :foreign_key => :creator_id
  has_many :states, :foreign_key => :creator_id
  has_many :streets, :foreign_key => :creator_id
  has_many :txts, :foreign_key => :creator_id
  has_many :units, :foreign_key => :creator_id
  has_many :visits, :foreign_key => :creator_id
  has_many :websites, :foreign_key => :creator_id
  has_many :website_uses, :foreign_key => :creator_id
  has_many :zips, :foreign_key => :creator_id
  
  has_many :authorizations
  
  group_targets_of 'authorizations'
  
  def name
    login
  end
end
