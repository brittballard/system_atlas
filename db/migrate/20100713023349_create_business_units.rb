class CreateBusinessUnits < ActiveRecord::Migration
  def self.up
    create_table :business_units do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :business_units
  end
end
