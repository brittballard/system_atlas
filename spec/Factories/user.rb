Factory.define(:user) do |user|
  user.password('brittonballard')
  user.password_confirmation('brittonballard')
  user.sequence(:email) {|n| "davidbritton.ballard#{n}@gmail.com"}
  user.roles_mask(3)
  user.association :organization
end