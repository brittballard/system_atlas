class Team < ActiveRecord::Base
  include EntityDefinition
  
  validates_presence_of(:name)
end
