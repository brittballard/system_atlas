class DatabaseServersController < EntityDefinitionController
  load_and_authorize_resource :except => [:index]
  
  def index
    @database_servers = DatabaseServer.accessible_by(current_ability, :read)
  end
  
  def create
    if create_entity_definition(@database_server, "Database Server")
      @database_servers = DatabaseServer.accessible_by(current_ability, :read)
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
  end
  
  def update
    if @database_server.update_attributes(params[:database_server])
      flash[:notice] = "Database Server updated successfully."
      @database_servers = DatabaseServer.accessible_by(current_ability, :read)
      render :index
    else
      flash[:error] = "ERROR! #{@database_server.errors.full_messages}"
    end
  end
end
