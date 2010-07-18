class DatabaseServersController < ApplicationController
  load_and_authorize_resource :except => [:index]
  
  def index
    @data_base_servers = DatabaseServer.accessible_by(current_ability, :read)
  end
  
  def create
    entity = @database_server.entity
    @database_server.entity = nil
    success = @database_server.save
    entity.entity_definition = @database_server
    
    if success && entity.save
      flash[:notice] = 'Good work!'
      render :index
    else
      flash[:error] = 'ERROR! ' + @database_server.errors.full_messages.join('<br />') + entity.errors.full_messages.join('<br />')
      render :new
    end
  end
  
  def new
    
  end
  
  def show
    
  end
  
end
