class RemoveRegistrationCodeFromOrganization < ActiveRecord::Migration
  def up
    remove_column :organizations, :registration_code
  end

  def down
    add_column :organizations, :registration_code, :integer
  end
end
