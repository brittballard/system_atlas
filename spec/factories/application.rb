FactoryGirl.define do
  factory :application do
    after(:build) do |application|
      application.entity = Entity.new(
        organization: application.organization,
        entity_definition: application,
        system_identifier: 'test'
      )
    end
    name('test server')
    description('my favorite server')
    organization
  end
end
