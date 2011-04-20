class DatabaseServer < ActiveRecord::Base
  include EntityDefinition
  has_one :database_software, :class_name => "Software"
end
