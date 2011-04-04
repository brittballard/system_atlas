class ApplicationServersController < EntityDefinitionController
  load_and_authorize_resource :except => [:index]

  def index
    @application_servers = ApplicationServer.accessible_by(current_ability, :read)
  end

  def create
    create_entity_definition(@application_server, "Application Server")
  end

  def new

  end

  def show

  end

  def edit
    @application_server = ApplicationServer.find(params[:id])
  end

  def update

  end

end