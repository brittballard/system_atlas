require 'spec_helper'

feature 'User', js: true do
  scenario 'associates two entities' do
    user = create(:user)
    application = create(:application, organization: user.organization, name: 'app 1')
    child = create(:application, organization: user.organization, name: 'app 2')

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    visit manage_entity_relationships_path(application.entity)
    find(:xpath, "//*[@data-entity-id='#{child.entity.id}']").click
    click_on 'Associate'

    within(:xpath, "//*[@data-role='child-container']") do
      expect(page).to have_content(child.name)
    end
  end
end
