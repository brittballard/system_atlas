class CreatePeopleAndTeamsTables < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :is_owner, :boolean
      t.timestamps
    end
    
    create_table :teams do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :people
    drop_table :teams
  end
end
