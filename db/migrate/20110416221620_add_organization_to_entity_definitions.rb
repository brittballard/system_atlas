class AddOrganizationToEntityDefinitions < ActiveRecord::Migration
  class Entity < ActiveRecord::Base
    belongs_to(:entity_definition, :polymorphic => true)
  end

  class Application < ActiveRecord::Base
    has_one :entity, :as => :entity_definition
    accepts_nested_attributes_for :entity
  end
  
  class DatabaseServer < ActiveRecord::Base
    has_one :entity, :as => :entity_definition
    accepts_nested_attributes_for :entity
  end
  
  class ApplicationServer < ActiveRecord::Base
    has_one :entity, :as => :entity_definition
    accepts_nested_attributes_for :entity
  end
  
  class BusinessUnit < ActiveRecord::Base
    has_one :entity, :as => :entity_definition
    accepts_nested_attributes_for :entity
  end
  
  class Person < ActiveRecord::Base
    has_one :entity, :as => :entity_definition
    accepts_nested_attributes_for :entity
  end
  
  class Team < ActiveRecord::Base
    has_one :entity, :as => :entity_definition
    accepts_nested_attributes_for :entity
  end
  
  class Server < ActiveRecord::Base
    has_one :entity, :as => :entity_definition
    accepts_nested_attributes_for :entity
  end
  
  def self.up
    add_column(:applications, :organization_id, :integer)
    add_column(:database_servers, :organization_id, :integer)
    add_column(:application_servers, :organization_id, :integer)
    add_column(:business_units, :organization_id, :integer)
    add_column(:people, :organization_id, :integer)
    add_column(:teams, :organization_id, :integer)
    add_column(:servers, :organization_id, :integer)
    
    Application.reset_column_information
    DatabaseServer.reset_column_information
    ApplicationServer.reset_column_information
    BusinessUnit.reset_column_information
    Person.reset_column_information
    Team.reset_column_information
    Server.reset_column_information

    Entity.all.each do |entity|
      unless entity.entity_definition.nil?
        entity.entity_definition.organization_id = entity.organization_id
        entity.entity_definition.save!
      else
        entity.destroy
      end
    end
  end

  def self.down
    remove_column(:applications, :organization_id)
    remove_column(:database_servers, :organization_id)
    remove_column(:application_servers, :organization_id)
    remove_column(:business_units, :organization_id)
    remove_column(:people, :organization_id)
    remove_column(:teams, :organization_id)
    remove_column(:servers, :organization_id)
  end
end
