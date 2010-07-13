class CreateDatabaseServers < ActiveRecord::Migration
  def self.up
    create_table :database_servers do |t|
      t.integer :database_software_id
      t.timestamps
    end
  end

  def self.down
    drop_table :database_servers
  end
end
