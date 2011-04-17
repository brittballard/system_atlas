class EntityDefinitionController < ApplicationController
  before_filter :authenticate_user!

  private

    def create_entity_definition(entity_definition_object, entity_definition_type)
      entity = Entity.load_entity_for_save(entity_definition_object, current_user)

      if entity.entity_definition.valid? && entity.save
        flash[:notice] = "#{entity_definition_type} created successfully."
        render :index
      else
        flash[:error] = "Error: #{(entity.entity_definition.errors.full_messages + entity.errors.full_messages).join('<br />')}"
        render :new
      end
    end

end