class ApplicationServer < ActiveRecord::Base
  has_one :entity, :as => :entity_definition
  has_one :web_server, :class_name => "Software"
  has_one :organization, :through => :entity
  
  accepts_nested_attributes_for :entity
end
