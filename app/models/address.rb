class Address < ActiveRecord::Base
  has_many :address_uses
  belongs_to :street
  belongs_to :zip
end
