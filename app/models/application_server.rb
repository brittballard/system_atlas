class ApplicationServer < ActiveRecord::Base
  has_one :entity, :as => :entity_definition
end
