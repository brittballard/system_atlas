class RelationshipsController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  def index
    @entity = Entity.find(params[:entity_id])
  end

  def new

  end

  def create
    relationship = EntityRelationship.new(:parent_id => params[:parent_id], :child_id => params[:child_id])
    relationship.save!
  end

  def destroy
    EntityRelationship.destroy(params[:id])
  end
  
  def manage
    @parent = Entity.find(params[:entity_id])
    @entities = Entity.accessible_by(current_ability, :read)
  end

end
