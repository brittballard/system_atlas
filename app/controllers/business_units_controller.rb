class BusinessUnitsController < ApplicationController
  load_and_authorize_resource :except => [:index]

  def index
    @business_unit = BusinessUnit.accessible_by(current_ability, :read)
  end

  def create
    entity = load_entity_for_save(@business_unit)

    if entity.entity_definition.valid? && entity.save
      flash[:notice] = 'Good work!'
      render :index
    else
      flash[:error] = 'ERROR! ' + @business_unit.errors.full_messages.join('<br />') + entity.errors.full_messages.join('<br />')
      render :new
    end
  end

  def new

  end

  def show

  end

end
