class CreateEntityRelationshipsTable < ActiveRecord::Migration
  def self.up
    create_table(:entity_relationships, :id => false) do |t|
      t.integer(:parent_id)
      t.integer(:child_id)
    end
    
    add_index(:entity_relationships, [:parent_id, :child_id], :unique => true)
  end

  def self.down
    drop_table(:entity_relationships)
  end
end
