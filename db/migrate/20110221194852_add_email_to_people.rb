class AddEmailToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :email, :string
    remove_column :people, :boolean
  end

  def self.down
    remove_column :people, :email
    add_column :people, :boolean, :string
  end
end
