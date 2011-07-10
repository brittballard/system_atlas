class DashboardsController < ApplicationController
  before_filter :authenticate_user!

  def home
    @applications = Application.accessible_by(current_ability, :read)
  end
  
end