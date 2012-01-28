class AddNameToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :name, :string, :limit => 100
    add_column :applications, :description, :string
  end
end
