class ServersController < EntityDefinitionController
  load_and_authorize_resource :except => [:index]

  def index
    @servers = Server.accessible_by(current_ability, :read)
  end

  def create
    if create_entity_definition(@server, "Server")
      @servers = Server.accessible_by(current_ability, :read)
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
    if @server.update_attributes(params[:server])
      flash[:notice] = "Server updated successfully."
      @servers = Server.accessible_by(current_ability, :read)
      render :index
    else
      flash[:error] = "ERROR! #{@server.errors.full_messages}"
    end
  end

end
