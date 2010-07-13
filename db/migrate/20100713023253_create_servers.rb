class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.integer :operating_system_software_id
      t.string :ip_address, :limit => 100
      t.float :ram
      t.float :hard_disk_space
      t.float :cpu_speed
      t.integer :cpu_count
      t.timestamps
    end
  end

  def self.down
    drop_table :servers
  end
end
