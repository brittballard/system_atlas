Given /^I am logged in as an? "([^"]*)" for organization_id (\d+)$/ do |role, organization_id|
  @user = Factory.create(:user, :roles_mask => ([role.downcase] & User::ROLES).map { |r| 2**User::ROLES.index(r) }.sum, :organization => Factory.create(:organization, :id => organization_id))
  And %{I go to the login page}
  And %{I fill in "user_email" with "#{@user.email}"}
  And %{I fill in "user_password" with "#{@user.password}"}
  And %{I press "Sign in"}
end
