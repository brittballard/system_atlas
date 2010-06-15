class OrganizationsController < ApplicationController
  load_and_authorize_resource
  
  def index
    
  end
  
  def new
    
  end
  
  def create
    
  end
  
  def edit
    
  end
  
  def update
    if @organization.save
      render 'dashboards/home'
    else
      flash[:error] = "ERROR!"
    end
  end
  
end
