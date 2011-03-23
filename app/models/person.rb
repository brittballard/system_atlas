class Person < ActiveRecord::Base
  has_one :entity, :as => :entity_definition
  has_one :organization, :through => :entity
  
  accepts_nested_attributes_for :entity
end
