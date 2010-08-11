class RelationshipsController < ApplicationController

  def new
    @entities = Entity.accessible_by(current_ability, :read)
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

end
