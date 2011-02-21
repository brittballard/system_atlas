class PeopleController < ApplicationController
  load_and_authorize_resource :except => [:index]
  
  def index
    @people = Person.accessible_by(current_ability, :read)
  end
  
  def create
    entity = load_entity_for_save(@person)
    
    if entity.entity_definition.valid? && entity.save
      flash[:notice] = 'Good work!'
      render :index
    else
      flash[:error] = 'ERROR! ' + @person.errors.full_messages.join('<br />') + entity.errors.full_messages.join('<br />')
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
