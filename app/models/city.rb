class City < ActiveRecord::Base
  belongs_to :state
  has_many :streets
  has_many :addresses, :through => :streets
  
  def country
    state.country
  end
  
  def units
    addresses.map(&:units).flatten
  end
end
