require 'spec_helper'

describe RegistrationsController do
  describe 'on POST to :step_two' do
    before do
      @organization = Factory.create(:organization)
      post(:step_two, :registration_code => @organization.registration_code)
    end

    it { assigns[:user].should be_present }
    it { response.should be_success }
    it { response.should render_template("step_two") }
  end

  describe 'on POST to :search_organizations with valid organization' do
    before do
      organization = Factory.create(:organization)
      post(:search_organizations, :organization => organization.attributes)
    end

    it { assigns[:search_organization].should be_present }
    it { assigns[:organizations].should be_present }
    it { response.should be_success }
    it { response.should render_template("step_one") }
  end

  describe 'on POST to :search_organizations with valid organization' do
    before do
      post(:search_organizations, :organization => Factory.attributes_for(:organization, :name => 'this is an invalid name no organization is named this'))
    end
  
    it { assigns[:search_organization].should be_present }
    it { assigns[:organizations].should_not be_present }
    it { response.should be_success }
    it { response.should render_template("step_one") }
    it { flash[:errors].should include('No organizations found matching your query.') }
  end
end
