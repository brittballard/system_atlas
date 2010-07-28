class EntitiesController < ApplicationController
  load_and_authorize_resource :except => [:index]
  
  def index
    @entities = Entity.accessible_by(current_ability, :read)
  end
  
  def create
    if @entity.save
      flash[:notice] = 'Good work!'
      render :index
    else
      flash[:error] = 'ERROR! ' + @entity.errors.full_messages.join('<br />')
      render :new
    end
  end
  
  def new
    
  end
  
  def show
    
  end
  
end
