class CreateHardwares < ActiveRecord::Migration
  def self.up
    create_table :hardwares do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :hardwares
  end
end
