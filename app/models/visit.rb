class Visit < ActiveRecord::Base
  has_many :guests, :as => :target

  def self.targets(format = :lowercase)
    case format
    when :lowercase
      %w[ address address_use city country establishment person state street unit ]
    when :capitalized
      %w[ Address AddressUse City Country Establishment Person State Street Unit ]
    end
  end
end
