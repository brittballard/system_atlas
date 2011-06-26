class RemoveIsOwnerFromPeople < ActiveRecord::Migration
  def self.up
    remove_column(:people, :is_owner)
  end

  def self.down
    add_column(:people, :is_owner, :boolean)
  end
end
