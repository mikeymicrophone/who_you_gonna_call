class Txt < ActiveRecord::Base
  belongs_to :phone
  
  has_many :details, :as => :target
  
  def name
    "text: #{phone.name} on #{time.strftime("%A")}"
  end
end
