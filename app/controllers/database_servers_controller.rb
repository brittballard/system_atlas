class DatabaseServersController < EntityDefinitionController
  load_and_authorize_resource :except => [:index]
  
  def index
    @database_servers = DatabaseServer.accessible_by(current_ability, :read)
  end
  
  def create
    create_entity_definition(@database_server, "Database Server")
  end
  
  def new
  end
  
  def show
  end
  
  def edit
    @database_server = DatabaseServer.find(params[:id])
  end
  
  def update
  end
end
