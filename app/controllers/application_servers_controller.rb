class ApplicationServersController < ApplicationController
  load_and_authorize_resource :except => [:index]

  def index
    @application_servers = ApplicationServer.accessible_by(current_ability, :read)
  end

  def create
    entity = Entity.load_entity_for_save(@application_server, current_user)
    
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

  def edit
    @application_server = ApplicationServer.find(params[:id])
  end

  def update

  end

end