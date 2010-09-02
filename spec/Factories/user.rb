Factory.define(:user) do |user|
  user.login('britton')
  user.password('brittonballard')
  user.password_confirmation('brittonballard')
  user.email('davidbritton.ballard@gmail.com')
  user.roles_mask(3)
end