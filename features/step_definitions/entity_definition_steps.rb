Then /^I should have an "([^"]*)" like$/ do |entity_definition_type, table|
  entity_definition = entity_definition_type.gsub(/ /,"").constantize.first
  table.rows_hash.each do |name, value|
    entity_definition.send(name).to_s.should == value
  end
  
  entity_definition.entity.should be
  entity_definition.entity.organization.should be
  entity_definition.organization.should == entity_definition.entity.organization
end