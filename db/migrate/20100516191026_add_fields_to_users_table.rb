class AddFieldsToUsersTable < ActiveRecord::Migration
  def self.up
    add_column(:users, :organization_id, :integer)
  end

  def self.down
    add_column(:users, :organization_id)
  end
end
