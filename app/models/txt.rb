class Txt < ActiveRecord::Base
  belongs_to :phone
  
  has_many :details, :as => :target
end
