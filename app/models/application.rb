class Application < ActiveRecord::Base
  include EntityDefinition
  
  validates_presence_of(:name)
  validates_presence_of(:description)
end
