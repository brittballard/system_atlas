Given /^I am logged in as an? "([^"]*)"$/ do |role|
  @user = Factory.create(:user, :roles => [Role.find_or_create_by_name(role.downcase)])
  And %{I go to the login page}
  And %{I fill in "email" with "#{@user.email}" within ".column-login-right"}
  And %{I fill in "password" with "#{@user.password}" within ".column-login-right"}
  And %{I press "sign in"}
end
