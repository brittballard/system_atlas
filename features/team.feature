Feature: User creates and maintains teams
  In order to create system atlases
  As a customer
  I need to be able to create and maintain my teams
  
  Scenario: Successful creation of a new team
  Given I am logged in as an "Admin"
  And I am on the new "Team" page
  When I fill in the following:
  | team_name        | britton's team |
  | team_description | big pimpin'    |
  And I press "create"
  Then I should see "Team created successfully."
  And I should have an "Team" like
  | name            | britton's team |
  | description     | big pimpin'    |
  | organization_id | 1000           |
