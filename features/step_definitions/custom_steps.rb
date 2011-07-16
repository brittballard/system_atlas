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