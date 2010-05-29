class RegistrationsController < ApplicationController
  
  def step_one
    @search_organization = Organization.new
  end
  
  def step_two
    
  end
  
  def search_organizations
    @search_organization = Organization.new(params[:organization])
    @organizations = Organization.filter(params[:organization])
    
    respond_to do |wants|
      wants.html do
        unless @organization.present? && @organization.any?
          flash[:notice] = 'No organizations found matching your query.'
        end

        render(:action => 'step_one')
      end
    end
  end
  
  def register_organization
    @search_organization = Organization.new
    @organizatio = Organization.new(params[:organization])
    
    respond_to do |wants|
      wants.html do
        if @organizatio.save
          render(:action => 'step_two')
        end
      end
    end
  end
  
end
