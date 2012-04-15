require 'spec_helper'

describe Organization do
  describe 'The filter method on the organizations model' do
    before do
      @organization = FactoryGirl.create(:organization)
    end
    
    it('should return all organizations when no params are provided') do
      Organization.filter({}).count.should == Organization.all.count
    end
    
    it('should return only organizations with the correct name when a name params is provided') do
      Organization.filter({ :name => @organization.name }).first.name.should == @organization.name
    end
    
    it('should return organizations even when the entire name is not provided thanks to the wild card') do
      Organization.filter({ :name => @organization.name[0,5] }).first.name[0,5].should == @organization.name[0,5]
    end
    
    it('should return organizations with the correct address when address param is provided') do
      Organization.filter({ :address_line_one => @organization.address_line_one }).first.address_line_one.should == @organization.address_line_one
      Organization.filter({ :address_line_two => @organization.address_line_two }).first.address_line_two.should == @organization.address_line_two
    end
    
    it('should return organizations with the correct state when state param is provided') do
      Organization.filter({ :state => @organization.state }).first.state.should == @organization.state
    end

    it('should return organizations with the correct state when city param is provided') do
      Organization.filter({ :city => @organization.city }).first.city.should == @organization.city
    end

    it('should return organizations with the correct postal code when a postal code param is provided') do
      Organization.filter({ :postal_code => @organization.postal_code }).first.postal_code.should == @organization.postal_code
    end
  end
end