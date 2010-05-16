class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.timestamps
      t.string :name, :limit => 100
      t.string :address_line_one, :limit => 255
      t.string :address_line_two, :limit => 255
      t.string :city, :limit => 100
      t.string :state, :limit => 50
      t.string :postal_code, :limit => 10
    end
  end

  def self.down
    drop_table :organizations
  end
end
