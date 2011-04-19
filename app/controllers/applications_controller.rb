class ApplicationsController < EntityDefinitionController
  load_and_authorize_resource :except => [:index]

  # GET /applications
  # GET /applications.xml
  def index
    @applications = Application.accessible_by(current_ability, :read)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @applications }
    end
  end

  # GET /applications/1
  # GET /applications/1.xml
  def show
    @application = Application.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @application }
    end
  end

  # GET /applications/new
  # GET /applications/new.xml
  def new

  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.xml
  def create
    if create_entity_definition(@application, "Application")
      @applications = Application.accessible_by(current_ability, :read)
      render :index
    else
      render :new
    end
  end

  # PUT /applications/1
  # PUT /applications/1.xml
  def update
    if @application.update_attributes(params[:application])
      flash[:notice] = "Team updated successfully."
      @applications = Application.accessible_by(current_ability, :read)
      render :index
    else
      flash[:error] = "ERROR! #{@application.errors.full_messages}"
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.xml
  def destroy
    @application = Application.find(params[:id])
    entity = @application.entity

    @application.destroy
    entity.destroy

    respond_to do |format|
      format.html { redirect_to(applications_url) }
      format.xml  { head :ok }
    end
  end
end
