class AddUserIdToPerson < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end
  
  class Person < ActiveRecord::Base
  end

  def self.up
    add_column(:people, :user_id, :integer)
    
    Person.reset_column_information
    Person.all.each do |person|
      user = User.where(:email => person.email).first
      unless user.nil?
        person.user_id = user.id
        person.organization_id = user.organization_id
        person.save!
      end
    end
  end

  def self.down
    remove_column(:people, :user_id)
  end
end
