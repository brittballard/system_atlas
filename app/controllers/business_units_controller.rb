class BusinessUnitsController < EntityDefinitionController
  load_and_authorize_resource :except => [:index]

  def index
    @business_unit = BusinessUnit.accessible_by(current_ability, :read)
  end

  def create
    if create_entity_definition(@business_unit, "Business Unit")
      @business_unit = BusinessUnit.accessible_by(current_ability, :read)
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
    if @business_unit.update_attributes(params[:business_unit])
      flash[:notice] = "Business unit updated successfully."
      @business_units = BusinessUnit.accessible_by(current_ability, :read)
      render :index
    else
      flash[:error] = "ERROR! #{@business_unit.errors.full_messages}"
    end
  end

end
