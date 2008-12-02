class Zip < ActiveRecord::Base
  has_many :addresses
  belongs_to :city
  belongs_to :state
end
