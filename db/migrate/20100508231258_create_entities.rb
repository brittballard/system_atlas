class CreateEntities < ActiveRecord::Migration
  def self.up
    create_table :entities do |t|
      t.timestamps
      t.string :description, :limit => 250
      t.string :name, :lmiit => 50
    end
  end

  def self.down
    drop_table :entities
  end
end
