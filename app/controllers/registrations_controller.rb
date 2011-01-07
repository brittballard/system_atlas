class RegistrationsController < ApplicationController
  
  def step_one
    @search_organization = Organization.new
  end
  
  def step_two
    @user = User.new
  end
  
  def search_organizations
    @search_organization = Organization.new(params[:organization])
    @organizations = Organization.filter(params[:organization])
    
    respond_to do |wants|
      wants.html do
        unless @organizations.present? && @organizations.any?
          flash[:errors] = 'No organizations found matching your query.'
        end

        render(:action => 'step_one')
      end
    end
  end
  
  private
  
    def setup_step_two(organization)
      @user = User.new
      @user.organization = organization
    end
  
end
