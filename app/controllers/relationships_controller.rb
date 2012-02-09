class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @entity_relationship = Entity.find(params[:entity_id]).entity_relationships
  end

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

  def delete
    Entity.find(params[:parent]).children.delete(Entity.find(params[:child]))
  end
  
  def manage
    @parent = Entity.find(params[:parent_id])
    @entities = Entity.accessible_by(current_ability, :read)
    render :new
  end

end
