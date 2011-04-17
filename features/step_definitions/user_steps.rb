Given /^I am logged in as an? "([^"]*)"$/ do |role|
  @user = Factory.create(:user, :roles_mask => ([role.downcase] & User::ROLES).map { |r| 2**User::ROLES.index(r) }.sum, :organization => Factory.create(:organization, :id => 1000))
  And %{I go to the login page}
  And %{I fill in "user_email" with "#{@user.email}"}
  And %{I fill in "user_password" with "#{@user.password}"}
  And %{I press "Sign in"}
end
