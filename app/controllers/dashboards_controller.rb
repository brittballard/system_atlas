class DashboardsController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  def home
    respond_with(@applications = Application.accessible_by(current_ability, :read))
  end
  
end