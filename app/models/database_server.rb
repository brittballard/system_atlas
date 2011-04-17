class DatabaseServer < ActiveRecord::Base
  include EntityDefinition
  act_as_entity_definition
  has_one :database_software, :class_name => "Software"
end
