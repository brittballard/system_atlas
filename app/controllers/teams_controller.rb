class TeamsController < ApplicationController
  load_and_authorize_resource :except => [:index]
  
  def index
    @teams = Team.accessible_by(current_ability, :read)
  end
  
  def create
    entity = Entity.load_entity_for_save(@team, current_user)
    
    if entity.entity_definition.valid? && entity.save
      flash[:notice] = 'Good work!'
      render :index
    else
      flash[:error] = 'ERROR! ' + @team.errors.full_messages.join('<br />') + entity.errors.full_messages.join('<br />')
      render :new
    end
  end
  
  def new
    
  end
  
  def show
    
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  
  def update
  end
end
