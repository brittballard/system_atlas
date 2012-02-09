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