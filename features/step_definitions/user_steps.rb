Given /^I am logged in as an? "([^"]*)"$/ do |role|
  step %{I am logged in as a "#{role}" for organization_id 1000}
end

Given /^I am logged in as an? "([^"]*)" for organization_id (\d+)$/ do |role, organization_id|
  @user = FactoryGirl.create(:user, :roles_mask => ([role.downcase] & User::ROLES).map { |r| 2**User::ROLES.index(r) }.sum, :organization => FactoryGirl.create(:organization, :id => organization_id))
  step %{I go to the login page}
  step %{I fill in "user_email" with "#{@user.email}"}
  step %{I fill in "user_password" with "#{@user.password}"}
  step %{I press "Sign in"}
end
