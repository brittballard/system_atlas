class BusinessUnit < ActiveRecord::Base
  has_one :entity, :as => :entity_definition
end
