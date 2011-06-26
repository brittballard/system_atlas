class DashboardsController < ApplicationController
  before_filter :authenticate_user!

  def home
    debugger
    @applications = Application.accessible_by(current_ability, :read)
  end
  
end