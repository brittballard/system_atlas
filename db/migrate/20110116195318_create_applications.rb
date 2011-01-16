class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.string :name, :limit => 50
      t.references :organization
      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
