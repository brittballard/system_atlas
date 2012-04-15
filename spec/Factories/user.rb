FactoryGirl.define do
  factory :user do
    password('brittonballard')
    password_confirmation('brittonballard')
    sequence(:email) {|n| "davidbritton.ballard#{n}@gmail.com"}
    roles_mask(3)
    organization
  end
end