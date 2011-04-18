class Person < ActiveRecord::Base
  include EntityDefinition
  act_as_entity_definition
  
  belongs_to :user
  attr_readonly :email
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
