class Alias < ActiveRecord::Base
  has_many :alias_uses
  belongs_to :service
end
