Given /^I debug$/ do
  breakpoint
end

Given /^I (own|don't own) the "([^"]*)"$/ do |do_i_own_it, entity_definition_type|
  if(do_i_own_it == "own")
    entity_definition = entity_definition_type.constantize.first
    user = User.first

    user.person.make_owner_of(entity_definition)
    entity_definition.children << user.person.entity
  end
end

Given /^"([^"]*)" and "([^"]*)" are related$/ do |application_one, application_two|
  app1 = Application.where("name = ?", application_one).first
  app2 = Application.where("name = ?", application_two).first
  
  relationship = EntityRelationship.new
  relationship.parent_id = app1.entity.id
  relationship.child_id = app2.entity.id
  
  relationship.save!
end

When /^I drag "([^"]*)" to "([^"]*)"$/ do |child_app, parent_app|
  child = Application.where("name = ?", child_app).first
  
  parent_element = page.find("#child-entities")
  child_element = page.find("#entity-#{child.entity.id}")
  
  child_element.drag_to(parent_element)
end

When /^I remove "([^"]*)"$/ do |child_app|
  child = Application.where("name = ?", child_app).first

  unassign_element = page.find("#available-entities")
  child_element = page.find("#entity-#{child.entity.id}")
  
  child_element.drag_to(unassign_element)
end

Then /^I should have a new relationship between "([^"]*)" and "([^"]*)"$/ do |parent_app, child_app|
  parent = Application.where("name = ?", parent_app).first
  child = Application.where("name = ?", child_app).first
  
  realtionship = EntityRelationship.where("parent_id = ? AND child_id = ?", parent.entity.id, child.entity.id).first
  realtionship.should_not be_nil
end

Then /^I should not have a relationship between "([^"]*)" and "([^"]*)"$/ do |parent_app, child_app|
  parent = Application.where("name = ?", parent_app).first
  child = Application.where("name = ?", child_app).first

  realtionship = EntityRelationship.where("parent_id = ? AND child_id = ?", parent.entity.id, child.entity.id).first
  realtionship.should be_nil
end

When /^I wait (\d+) second$/ do |seconds|
  sleep(Integer(seconds))
end