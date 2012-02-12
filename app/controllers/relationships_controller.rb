class RelationshipsController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  def index
    @entity = Entity.find(params[:entity_id])
  end

  def new

  end

  def create
    parent = Entity.find(params[:parent_id])
    child = Entity.find(params[:child_id])
    parent.children << child

    if parent.save
      flash[:notice] = 'Good work!'
    else
      flash[:error] = 'ERROR!'
    end
  end

  def destroy
    breakpoint
    Entity.find(params[:parent_id]).children.delete(Entity.find(params[:child_id]))
  end
  
  def manage
    @parent = Entity.find(params[:entity_id])
    @entities = Entity.accessible_by(current_ability, :read)
  end

end
