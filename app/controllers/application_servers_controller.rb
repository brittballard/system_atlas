class ApplicationServersController < EntityDefinitionController
  load_and_authorize_resource :except => [:index]

  def index
    @application_servers = ApplicationServer.accessible_by(current_ability, :read)
  end

  def create
    if create_entity_definition(@application_server, "Application Server")
      @application_servers = ApplicationServer.accessible_by(current_ability, :read)
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
    if @application_server.update_attributes(params[:application_server])
      flash[:notice] = "Application Server updated successfully."
      @application_servers = ApplicationServer.accessible_by(current_ability, :read)
      render :index
    else
      flash[:error] = "ERROR! #{@application_server.errors.full_messages}"
    end
  end
end