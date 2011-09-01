FactoryGirl.define do
  factory :person do
    sequence(:email) { |n| "davidballard#{n}@hotmail.com"}
    first_name("Britt")
    last_name("Ballard")
    association(:entity)
    association(:organization)
  end
end