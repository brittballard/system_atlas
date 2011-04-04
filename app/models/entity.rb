class Entity < ActiveRecord::Base
  validates_presence_of(:entity_definition_type)
  validates_presence_of(:entity_definition_id)
  validates_presence_of(:system_identifier)
  validates_presence_of(:organization_id)
  
  belongs_to(:organization)
  belongs_to(:entity_definition, :polymorphic => true)
  
  has_and_belongs_to_many :children, :class_name => "Entity", :join_table => "entity_relationships", :foreign_key => "parent_id", :association_foreign_key => "child_id"

  def self.load_entity_for_save(entity_definition, current_user)
    entity = entity_definition.entity
    entity_definition.entity = nil
    entity_definition.save
    entity.entity_definition = entity_definition
    entity.organization = current_user.organization
    entity.system_identifier = "O#{Date.today.to_formatted_s(:number)}#{Entity.count > 0 ? Entity.last.id + 1 : 1}"
    
    entity
  end
end
