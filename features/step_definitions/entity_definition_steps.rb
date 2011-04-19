Then /^I should have an? "([^"]*)" like$/ do |entity_definition_type, table|
  entity_definition = entity_definition_type.gsub(/ /,"").constantize.last
  table.rows_hash.each do |name, value|
    entity_definition.send(name).to_s.should == value
  end
end

Then /^The entity and definition organizations for the "([^"]*)" should be the same$/ do |entity_definition_type|
  entity_definition = entity_definition_type.gsub(/ /,"").constantize.last
  entity_definition.entity.should be
  entity_definition.entity.organization.should be
  entity_definition.organization.should == entity_definition.entity.organization
  entity_definition.organization.should == User.first.organization
end