class Message < ActiveRecord::Base
  belongs_to :service
  belongs_to :person
  
  has_many :details, :as => :target
  has_many :website_uses, :as => :target
  
  def name
    "message to #{person.name} on #{service.name}, #{time.strftime("%I %a %d")}"
  end
end
