Feature: User creates and maintains teams
  In order to create system atlases
  As a customer
  I need to be able to create and maintain my teams
  
  Scenario: Successful creation of a new team
  Given I am logged in as an "Admin" for organization_id 1000
  And I am on the new "Team" page
  When I fill in the following:
  | team_name        | britton's team |
  | team_description | big pimpin'    |
  And I press "create"
  Then I should see "Team created successfully."
  And I should have a "Team" like
  | name            | britton's team |
  | description     | big pimpin'    |
  | organization_id | 1000           |
  And The entity and definition organizations for the "Team" should be the same

  Scenario: Successful update of a team
  Given I am logged in as an "Admin" for organization_id 1000
  And the following team exists:
  | name         | description        | id | organization_id |
  | team to edit | my big description | 43 | 1000            |
  And I am on the edit "Team" page for id 43
  When I fill in the following:
  | team_name        | edited name        |
  | team_description | edited description |
  And I press "edit"
  Then I should see "Team updated successfully."
  And I should have a "Team" like
  | name            | edited name        |
  | description     | edited description |
  | organization_id | 1000               |
  | id              | 43                 |
