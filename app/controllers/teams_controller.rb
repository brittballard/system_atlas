class TeamsController < EntityDefinitionController
  load_and_authorize_resource :except => [:index]
  
  def index
    @teams = Team.accessible_by(current_ability, :read)
  end
  
  def create
    create_entity_definition(@team, "Team")
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
