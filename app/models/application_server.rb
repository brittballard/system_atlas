class ApplicationServer < ActiveRecord::Base
  include EntityDefinition
  has_one :web_server, :class_name => "Software"
  
  validates_presence_of(:name)
end
