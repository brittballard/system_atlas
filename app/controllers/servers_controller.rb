class ServersController < EntityDefinitionController
  respond_to :html, :json
  load_and_authorize_resource :except => [:index]

  def index
    # respond_with(@servers = Server.accessible_by(current_abiklity, :read))
    respond_with(@servers = Server.all)
  end

  def create
    if create_entity_definition(@server, "Server")
      @server = Server.accessible_by(current_ability, :read)
      respond_with(@server)
    else
      respond_with(@server, :status => :unprocessable_entity)
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
