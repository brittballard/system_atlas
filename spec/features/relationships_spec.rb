require 'spec_helper'

feature 'User', js: true do
  scenario 'associates an two entities' do
    user = create(:user)
    application = create(:application, organization: user.organization)
    create(:application, organization: user.organization)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    visit manage_entity_relationships_path(application.entity)
  end
end
