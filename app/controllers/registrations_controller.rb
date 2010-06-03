class RegistrationsController < ApplicationController
  
  def step_one
    @search_organization = Organization.new
  end
  
  def step_two
    setup_step_two(Organization.find_by_registration_code(params[:registration_code]))
  end
  
  def search_organizations
    @search_organization = Organization.new(params[:organization])
    @organizations = Organization.filter(params[:organization])
    
    respond_to do |wants|
      wants.html do
        unless @organizations.present? && @organizations.any?
          flash[:notice] = 'No organizations found matching your query.'
        end

        render(:action => 'step_one')
      end
    end
  end
  
  def register_organization
    @search_organization = Organization.new
    @organization = Organization.new(params[:organization])
    
    respond_to do |wants|
      wants.html do
        if @organization.save
          setup_step_two(@organization)
          render(:action => 'step_two')
        end
      end
    end
  end
  
  private
  
    def setup_step_two(organization)
      @user = User.new
      @user.organization = organization
    end
  
end
