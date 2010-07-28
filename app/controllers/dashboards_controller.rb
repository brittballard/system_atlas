class DashboardsController < ApplicationController

  def home
    @entities = Entity.accessible_by(current_ability, :read)
  end
  
end