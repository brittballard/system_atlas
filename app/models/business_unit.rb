class BusinessUnit < ActiveRecord::Base
  has_one :entity, :as => :entity_definition
  accepts_nested_attributes_for :entity
end
