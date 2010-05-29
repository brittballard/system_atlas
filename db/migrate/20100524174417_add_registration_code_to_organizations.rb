class AddRegistrationCodeToOrganizations < ActiveRecord::Migration
  def self.up
    add_column(:organizations, :registration_code, :integer)
    add_index(:organizations, :registration_code, :unique => true, :name => 'organizations_registration_code')
  end

  def self.down
    remove_column(:organizations, :registration_code)
  end
end
