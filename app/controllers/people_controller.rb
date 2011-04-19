class PeopleController < EntityDefinitionController
  load_and_authorize_resource :except => [:index]
  
  def index
    @people = Person.accessible_by(current_ability, :read)
  end
  
  def create
    if create_entity_definition(@person, "Person")
      @people = Person.accessible_by(current_ability, :read)
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
    @person = Person.find(params[:id])
  end
  
  def update
    
  end
end
