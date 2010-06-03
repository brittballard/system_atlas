require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  context 'on GET to :step_one' do
    setup do
      get :step_one
    end
    
    should_assign_to :search_organization
    should_respond_with :success
    should_render_template :step_one
    should_not_set_the_flash
  end
  
  context 'on POST to :step_two' do
    setup do
      @organization = Factory.create(:organization)
      post :step_two, :registration_code => @organization.registration_code
    end

    should_assign_to :user
    should_respond_with :success
    should_render_template :step_two
    should_not_set_the_flash
  end
  
  context 'on POST to :search_organizations with valid organization' do
    setup do
      organization =  Factory.create(:organization)
      post :search_organizations, :organization => organization.attributes
    end

    should_assign_to :search_organization, :organizations
    should_respond_with :success
    should_render_template :step_one
    should_not_set_the_flash
  end

  context 'on POST to :search_organizations with invalid organization' do
    setup do
      post :search_organizations, :organization => Factory.attributes_for(:organization, :name => 'this is an invalid name no organization is named this')
    end
    
    should_assign_to :search_organization, :organizations
    should_respond_with :success
    should_render_template :step_one
    should_set_the_flash_to 'No organizations found matching your query.'
  end

  context 'on POST to :register_organization' do
    setup do
      post :register_organization, :organization => Factory.attributes_for(:organization, :name => 'This could only be used to register the new org!')
    end
    
    should_assign_to :user
    should_respond_with :success
    should_render_template :step_two
    should_not_set_the_flash
    
    should 'create the new organization' do
      assert Organization.find_all_by_name('This could only be used to register the new org!').count == 1
    end
  end
end
