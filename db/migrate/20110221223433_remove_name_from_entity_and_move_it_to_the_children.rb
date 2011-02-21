class RemoveNameFromEntityAndMoveItToTheChildren < ActiveRecord::Migration
  def self.up
    remove_column :entities, :name, :description
    
    add_column :application_servers, :name, :string, :limit => 50
    add_column :database_servers, :name, :string, :limit => 50
    add_column :people, :first_name, :string, :limit => 50
    add_column :people, :last_name, :string, :limit => 50
    add_column :business_units, :name, :string, :limit => 50
    add_column :teams, :name, :string, :limit => 50
    
    add_column :application_servers, :description, :string, :limit => 250
    add_column :database_servers, :description, :string, :limit => 250
    add_column :business_units, :description, :string, :limit => 250
    add_column :teams, :description, :string, :limit => 250
  end

  def self.down
    add_column :entities, :name, :string
    add_column :entities, :description, :string
    
    remove_column :application_servers, :name
    remove_column :database_servers, :name
    remove_column :people, :first_name
    remove_column :people, :last_name
    remove_column :business_units, :name
    remove_column :teams, :name

    remove_column :application_servers, :description
    remove_column :database_servers, :description
    remove_column :business_units, :description
    remove_column :teams, :description
  end
end
