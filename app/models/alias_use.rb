class AliasUse < ActiveRecord::Base
  belongs_to :alias
  belongs_to :person
end
