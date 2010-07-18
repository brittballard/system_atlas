class AddNameToSoftwares < ActiveRecord::Migration
  def self.up
    add_column(:softwares, :name, :string, :limit => 100)
  end

  def self.down
    remove_column(:softwares, :name)
  end
end
