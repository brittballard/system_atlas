class BusinessUnitsController < EntityDefinitionController
  load_and_authorize_resource :except => [:index]

  def index
    @business_unit = BusinessUnit.accessible_by(current_ability, :read)
  end

  def create
    create_entity_definition(@business_unit, "Business Unit")
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
