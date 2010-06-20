require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  setup do
    Factory.create(:entity)
  end
  
  should_validate_presence_of(:name)
  should_validate_presence_of(:it_owner_id)
  should_validate_presence_of(:business_owner_id)
  should_validate_presence_of(:entity_definition_type)
  should_validate_presence_of(:entity_definition_id)
  should_validate_presence_of(:system_identifier)
  should_validate_presence_of(:organization_id)
  should_validate_uniqueness_of(:name, :scoped_to => [:organization_id])
end
