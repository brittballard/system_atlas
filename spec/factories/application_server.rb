FactoryGirl.define do
  factory :application_server do
    name('test server')
    description('my favorite server')
    association(:entity)
  end
end