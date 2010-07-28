class RelationshipsController < ApplicationController
  
  def new
    @entities = Entity.accessible_by(current_ability, :read)
  end
  
  def create
    
  end
  
end
