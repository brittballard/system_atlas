class ServersController < ApplicationController
  load_and_authorize_resource :except => [:index]

  def index
    @servers = Servers.accessible_by(current_ability, :read)
  end

  def create
    entity = load_entity_for_save(@servers)

    if entity.entity_definition.valid? && entity.save
      flash[:notice] = 'Good work!'
      render :index
    else
      flash[:error] = 'ERROR! ' + @servers.errors.full_messages.join('<br />') + entity.errors.full_messages.join('<br />')
      render :new
    end
  end

  def new

  end

  def show

  end

end
