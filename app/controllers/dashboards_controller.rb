class DashboardsController < ApplicationController

  def home
    @applications = Application.accessible_by(current_ability, :read)
  end
  
end