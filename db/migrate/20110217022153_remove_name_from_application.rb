class RemoveNameFromApplication < ActiveRecord::Migration
  def self.up
    remove_column :applications, :name
    remove_column :applications, :organization_id
  end

  def self.down
    add_column :applications, :name, :string
    add_column :applications, :name, :string
  end
end
