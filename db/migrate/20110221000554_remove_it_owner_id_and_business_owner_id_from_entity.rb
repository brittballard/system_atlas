class RemoveItOwnerIdAndBusinessOwnerIdFromEntity < ActiveRecord::Migration
  def self.up
    remove_column :entities, :it_owner_id
    remove_column :entities, :business_owner_id
  end

  def self.down
    add_column :entities, :it_owner_id, :integer
    add_column :entities, :business_owner_id, :integer
  end
end
