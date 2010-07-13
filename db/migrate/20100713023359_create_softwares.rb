class CreateSoftwares < ActiveRecord::Migration
  def self.up
    create_table :softwares do |t|
      t.string :version, :limit => 10
      t.string :licenses, :limit => 10
      t.string :type
      t.timestamps
    end
  end

  def self.down
    drop_table :softwares
  end
end
