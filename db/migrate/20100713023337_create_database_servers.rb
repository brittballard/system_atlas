class CreateDatabaseServers < ActiveRecord::Migration
  def self.up
    create_table :database_servers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :database_servers
  end
end
