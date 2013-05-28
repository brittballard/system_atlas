require 'spec_helper'

feature 'User', js: true do
  scenario 'associates two entities' do
    setup

    sign_in

    visit manage_entity_relationships_path(@application.entity)
    find(:xpath, "//*[@data-entity-id='#{@child.entity.id}']").click
    click_on 'Associate'

    within(:xpath, "//*[@data-role='child-container']") do
      expect(page).to have_content(@child.name)
    end

    within(:xpath, "//*[@data-role='entity-list']") do
      expect(page).not_to have_content(@child.name)
    end
  end

  scenario 'associates two entities' do
    setup
    child_two = create(:application, organization: @user.organization, name: 'app 2')

    sign_in

    visit manage_entity_relationships_path(@application.entity)
    child_node = find(:xpath, "//*[@data-entity-id='#{@child.entity.id}']")
    child_node_two = find(:xpath, "//*[@data-entity-id='#{child_two.entity.id}']")
    child_node.drag_to(child_node_two)
    click_on 'Associate'

    within(:xpath, "//*[@data-role='child-container']") do
      expect(page).to have_content(@child.name)
      expect(page).to have_content(child_two.name)
    end

    within(:xpath, "//*[@data-role='entity-list']") do
      expect(page).not_to have_content(@child.name)
      expect(page).not_to have_content(child_two.name)
    end
  end

  def sign_in
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
  end

  def setup
    @user = create(:user)
    @application = create(:application, organization: @user.organization, name: 'app 1')
    @child = create(:application, organization: @user.organization, name: 'app 2')
  end
end
