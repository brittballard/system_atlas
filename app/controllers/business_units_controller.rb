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
    @business_unit = BusinessUnit.find(params[:id])
  end

  def update
    
  end

end
