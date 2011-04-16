class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def new

  end

  def create
    parent = Entity.find(params[:parent])
    child = Entity.find(params[:child])
    parent.children << child

    if parent.save
      flash[:notice] = 'Good work!'
    else
      flash[:error] = 'ERROR!'
    end
  end

  def delete_relationship
    Entity.find(params[:parent]).children.delete(Entity.find(params[:child]))
  end
  
  def manage_relationship
    @parent = Entity.find(params[:parent_id])
    @entities = Entity.accessible_by(current_ability, :read).where("entity_definition_type <> 'Application'")
    render :new
  end

end
