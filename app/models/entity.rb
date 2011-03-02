class Entity < ActiveRecord::Base
  validates_presence_of(:entity_definition_type)
  validates_presence_of(:entity_definition_id)
  validates_presence_of(:system_identifier)
  validates_presence_of(:organization_id)
  
  belongs_to(:organization)
  belongs_to(:entity_definition, :polymorphic => true)
  
  has_and_belongs_to_many :children, :class_name => "Entity", :join_table => "entity_relationships", :foreign_key => "parent_id", :association_foreign_key => "child_id"
end
