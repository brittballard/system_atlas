require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  should_have_many(:users)
  should_validate_presence_of(:name)
  should_validate_presence_of(:address_line_one)
  should_validate_presence_of(:city)
  should_validate_presence_of(:state)
  should_validate_presence_of(:postal_code)
  
  context('The filter method on the organizations model') do
    setup do
      @organization = Factory.create(:organization)
    end
    
    should('return all organizations when no params are provided') do
      assert_equal(Organization.all.count, Organization.filter({}).count)
    end
    
    should('return only organizations with the correct name when a name params is provided') do
      assert_equal(@organization.name, Organization.filter({ :name => @organization.name }).first.name)
    end
    
    should('return organizations even when the entire name is not provided thanks to the wild card') do
      assert_equal(@organization.name[0,5], Organization.filter({ :name => @organization.name[0,5] }).first.name[0,5])
    end
    
    should('return organizations with the correct address when address param is provided') do
      assert_equal(@organization.address_line_one, Organization.filter({ :address_line_one => @organization.address_line_one }).first.address_line_one)
      assert_equal(@organization.address_line_two, Organization.filter({ :address_line_two => @organization.address_line_two }).first.address_line_two)
    end
    
    should('return organizations with the correct state when state param is provided') do
      assert_equal(@organization.state, Organization.filter({ :state => @organization.state }).first.state)
    end

    should('return organizations with the correct state when city param is provided') do
      assert_equal(@organization.city, Organization.filter({ :city => @organization.city }).first.city)
    end

    should('return organizations with the correct postal code when a postal code param is provided') do
      assert_equal(@organization.postal_code, Organization.filter({ :postal_code => @organization.postal_code }).first.postal_code)
    end
  end
end
