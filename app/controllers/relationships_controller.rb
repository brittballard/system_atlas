class RelationshipsController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!

  def index
    @entity = Entity.find(params[:entity_id])
  end

  def new

  end

  def create
    @relationships = []
    params[:child_ids].each do |child_id|
      relationship = EntityRelationship.new(
        parent_id: params[:parent_id],
        child_id: child_id
      )
      relationship.save!
      @relationships << relationship
    end
  end

  def destroy
    @children = []
    @ids = params[:ids]
    params[:ids].each do |id|
      @children << EntityRelationship.find(id).child
      EntityRelationship.destroy(id)
    end
  end

  def manage
    @parent = Entity.accessible_by(current_ability, :read).find(params[:entity_id])
    @entities = Entity.accessible_by(current_ability, :read).where("id not in(?)", 
                                                                    [params[:entity_id]].concat(@parent.children.map{ |child| child.id }))
  end
end
