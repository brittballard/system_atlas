Factory.define(:entity) do |entity|
  entity.sequence(:name){ |n| "The big entity #{n}" }
  entity.description('The big entity description.')
  entity.it_owner_id(1)
  entity.business_owner_id(1)
  entity.entity_definition_type('test')
  entity.entity_definition_id(1)
  entity.system_identifier('test_test_test_test')
  entity.organization_id(1)
end