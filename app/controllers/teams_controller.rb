class TeamsController < EntityDefinitionController
  load_and_authorize_resource :except => [:index]
  
  def index
    @teams = Team.accessible_by(current_ability, :read)
  end
  
  def create
    if create_entity_definition(@team, "Team")
      @teams = Team.accessible_by(current_ability, :read)
      render :index
    else
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
    if @team.update_attributes(params[:team])
      flash[:notice] = "Team updated successfully."
      redirect_to teams_path
    else
      flash[:error] = "ERROR! #{@team.errors.full_messages}"
    end
  end
  
end
