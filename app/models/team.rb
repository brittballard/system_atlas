class Team < ActiveRecord::Base
  include EntityDefinition
  act_as_entity_definition
end
