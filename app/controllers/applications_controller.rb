class ApplicationsController < EntityDefinitionController
  respond_to :html, :json
  load_and_authorize_resource :except => [:index]

  # GET /applications
  # GET /applications.xml
  def index
    respond_with(@applications = Application.accessible_by(current_ability, :read))
  end

  # GET /applications/1
  # GET /applications/1.xml
  def show
    respond_with(@application = Application.find(params[:id]))
  end

  # GET /applications/new
  # GET /applications/new.xml
  def new
    @application = Application.new
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
      flash[:notice] = "Application updated successfully."
      @applications = Application.accessible_by(current_ability, :read)
      render :index
    else
      flash[:error] = "ERROR! #{@application.errors.full_messages}"
      render :edit
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
