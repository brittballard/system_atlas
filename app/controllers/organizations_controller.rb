class OrganizationsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @organizations = Organization.accessible_by(current_ability, :manage)
  end
  
  def new
    
  end
  
  def create
    @organization = Organization.new(params[:organization])
    
    respond_to do |wants|
      wants.html do
        if @organization.save
          redirect_to organization_path(@organization)
        else
          render(:new)
        end
      end
    end
  end
  
  def edit
    
  end
  
  def show
  end
  
  def update
    if @organization.save
      render 'dashboards/home'
    else
      flash[:error] = "ERROR!"
    end
  end
  
  def destroy
    Organization.destroy(params[:id])
    redirect_to account_url
  end
  
end
