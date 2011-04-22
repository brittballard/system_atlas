class AddDescriptionAndIsOwnerToEntityRelationships < ActiveRecord::Migration
  class EntityRelationshipOld < ActiveRecord::Base
  end

  class EntityRelationship < ActiveRecord::Base
  end

  def self.up
    rename_table :entity_relationships, :entity_relationship_olds
    create_table :entity_relationships do |t|
      t.integer :parent_id, :nil => false
      t.integer :child_id, :nil => false
      t.boolean :is_owner
      t.string :description
    end
    
    EntityRelationship.reset_column_information
    EntityRelationshipOld.reset_column_information
    
    EntityRelationshipOld.all.each do |e|
      EntityRelationship.new(:child_id => e.child_id, :parent_id => e.parent_id).save!
    end
    
    drop_table :entity_relationship_olds
  end

  def self.down
    remove_column(:entity_relationships, :is_owner)
    remove_column(:entity_relationships, :description)
    remove_column(:entity_relationships, :id)
  end
end
