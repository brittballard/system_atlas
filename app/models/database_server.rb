class DatabaseServer < ActiveRecord::Base
  has_one :entity, :as => :entity_definition
  has_one :database_software, :class_name => "Software"
  has_one :organzation, :through => :entity
  
  accepts_nested_attributes_for :entity
end
