Given /^I am logged in as an? "([^"]*)"$/ do |role|
  @user = Factory.create(:user, :roles_mask => (role & ROLES).map { |r| 2**ROLES.index(r) }.sum)
  And %{I go to the login page}
  And %{I fill in "email" with "#{@user.email}"}
  And %{I fill in "password" with "#{@user.password}"}
  And %{I press "Login"}
end
