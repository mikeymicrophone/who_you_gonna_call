class Phone < ActiveRecord::Base
  has_many :phone_uses
  has_many :calls, :as => :target
end
