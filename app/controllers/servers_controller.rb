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

end
