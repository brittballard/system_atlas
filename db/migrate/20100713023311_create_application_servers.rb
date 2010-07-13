class CreateApplicationServers < ActiveRecord::Migration
  def self.up
    create_table :application_servers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :application_servers
  end
end
