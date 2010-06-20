class AddNewColumnsToEntity < ActiveRecord::Migration
  def self.up
    add_column(:entities, :entity_type, :string, :limit => 50)
    add_column(:entities, :entity_id, :integer)
    add_column(:entities, :it_owner_id, :integer)
    add_column(:entities, :business_owner_id, :integer)
    add_column(:entities, :system_identifier, :string, :limit => 45)
  end

  def self.down
    remove_column(:entities, :entity_type, :entity_id, :it_owner_id, :business_owner_id, :system_identifier)
  end
end
