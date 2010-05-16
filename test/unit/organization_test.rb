require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  should_have_many :users
  should_validate_presence_of :name
  should_validate_presence_of :address_line_one
  should_validate_presence_of :city
  should_validate_presence_of :state
  should_validate_presence_of :postal_code
end
