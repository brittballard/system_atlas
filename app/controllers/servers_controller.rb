class ServersController < EntityDefinitionController
  load_and_authorize_resource :except => [:index]

  def index
    @servers = Server.accessible_by(current_ability, :read)
  end

  def create
    create_entity_definition(@server, "Server")
  end

  def new

  end

  def show

  end

end
