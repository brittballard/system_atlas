class ApplicationServer < ActiveRecord::Base
  include EntityDefinition
  act_as_entity_definition
  has_one :web_server, :class_name => "Software"
end
