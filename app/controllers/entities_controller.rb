class EntitiesController < ApplicationController
  load_and_authorize_resource :except => [:index]
  
  def index
    @entities = User.accessible_by(current_ability, :read)
  end
  
  def create
    
  end
  
  def new
    
  end
  
  def show
    
  end
  
end
