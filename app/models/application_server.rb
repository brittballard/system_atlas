class ApplicationServer < ActiveRecord::Base
  include EntityDefinition
  has_one :web_server, :class_name => "Software"
end
