FactoryGirl.define do
  factory :entity do
    entity_definition_type('test')
    entity_definition_id(1)
    system_identifier('test_test_test_test')
    organization_id(1)
  end
end