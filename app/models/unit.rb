class Unit < ActiveRecord::Base
  belongs_to :address
  has_many :address_uses
end
