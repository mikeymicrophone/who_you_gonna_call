class AliasUse < ActiveRecord::Base
  belongs_to :alia, :class_name => 'Alias'
  belongs_to :person
  
  def name
    "#{person.name} is #{alia.name}@#{alia.service.name}"
  end
end
