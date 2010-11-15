Factory.define(:organization_test) do |organization|
  organization.name('britton\'s organization')
  organization.address_line_one('3800 Commerce')
  organization.address_line_two('203')
  organization.city('Dallas')
  organization.state('Texas')
  organization.postal_code('75226')
end

Factory.define(:entity_test) do |entity|
  entity.sequence(:name){ |n| "The big entity #{n}" }
  entity.description('The big entity description.')
  entity.it_owner_id(1)
  entity.business_owner_id(1)
  entity.entity_definition_type('test')
  entity.entity_definition_id(1)
  entity.system_identifier('test_test_test_test')
  entity.organization_id(1)
end