class DatabaseServer < ActiveRecord::Base
  include EntityDefinition
  has_one :database_software, :class_name => "Software"
  
  validates_presence_of(:name)
end
