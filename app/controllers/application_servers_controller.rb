class ApplicationServersController < ApplicationController
  load_and_authorize_resource :except => [:index]

  def index
    @database_servers = ApplicationServer.accessible_by(current_ability, :read)
  end

  def create
    entity = load_entity_for_save(@application_server)

    if entity.entity_definition.valid? && entity.save
      flash[:notice] = 'Good work!'
      render :index
    else
      flash[:error] = 'ERROR! ' + @application_server.errors.full_messages.join('<br />') + entity.errors.full_messages.join('<br />')
      render :new
    end
  end

  def new

  end

  def show

  end

end