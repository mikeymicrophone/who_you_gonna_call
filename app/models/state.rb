class State < ActiveRecord::Base
  has_many :cities
  belongs_to :country
  has_many :streets, :through => :cities
end
