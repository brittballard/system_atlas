class Application < ActiveRecord::Base
  include EntityDefinition
  
  validates_presence_of(:name)
end
