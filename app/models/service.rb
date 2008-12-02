class Service < ActiveRecord::Base
  has_many :aliases
  has_many :messages
end
