class Entity < ActiveRecord::Base
  validates_presence_of(:entity_definition_type)
  validates_presence_of(:system_identifier)
  validates_presence_of(:organization_id)
  
  belongs_to(:organization)
  belongs_to(:entity_definition, :polymorphic => true)
  
  has_many :entity_relationships, :foreign_key => :parent_id
  has_many :child_entity_relationships, :class_name => 'EntityRelationship', :foreign_key => :child_id

  has_many :children, :through => :entity_relationships
  
  scope :people, where(:entity_definition_type => Person.to_s)
  
  scope :current_users_entities, lambda { |user| 
                                            joins("INNER JOIN entity_relationships er ON er.parent_id = entities.id")
                                            .joins("INNER JOIN entities e2 on e2.id = er.child_id")
                                            .joins("INNER JOIN people p on p.id = e2.entity_definition_id AND e2.entity_definition_type = '#{Person.to_s}'")
                                            .where("p.user_id = ?", user.id) }

  def owners
    children.people.where("#{EntityRelationship.quoted_table_name}.is_owner = true")
  end

  def self.load_entity_for_save(entity_definition, current_user)
    entity = entity_definition.entity

    entity_definition.entity = nil
    entity_definition.organization = current_user.organization
    entity_definition.save
    
    entity.entity_definition = entity_definition
    entity.organization = current_user.organization
    entity.system_identifier = "O#{Date.today.to_formatted_s(:number)}#{Entity.count > 0 ? Entity.last.id + 1 : 1}"
    
    entity
  end
end
