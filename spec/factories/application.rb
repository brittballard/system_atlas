FactoryGirl.define do 
  factory :application do
      name('test server')
      description('my favorite server')
      entity
      organization_id(1000)
  end
end