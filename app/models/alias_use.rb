class AliasUse < ActiveRecord::Base
  belongs_to :alias
  belongs_to :person
  
  def name
    "#{person.name} is #{alias.name}@#{alias.service.name}"
  end
end
