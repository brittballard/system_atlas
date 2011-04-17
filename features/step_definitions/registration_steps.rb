Then /^I should find a Person record with email "([^"]*)" and organization_id (\d+)$/ do |email, organization_id|
  Person.where(:email => email, :organization_id => organization_id).count.should == 1
end
