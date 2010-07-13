class CreateApplicationServers < ActiveRecord::Migration
  def self.up
    create_table :application_servers do |t|
      t.integer :web_server_id
      t.timestamps
    end
  end

  def self.down
    drop_table :application_servers
  end
end
