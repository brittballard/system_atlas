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
  And I am on the "Teams" page
  And I follow "edit"
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

  Scenario Outline: Admin, operator, and user read abilities check
  Given I am logged in as a "<user>" for organization_id <organization_id>
  And the following team exists:
  | name          | organization_id |
  | viewable team | 1000            |
  When I am on the "Teams" page
  Then I should <should_i_see_it> "viewable team"
  
  Scenarios:
  | user     | organization_id | should_i_see_it |
  | Operator | 1               | see             |
  | Operator | 1000            | see             |
  | Admin    | 1000            | see             |
  | Admin    | 1               | not see         |
  | User     | 1               | not see         |
  | User     | 1000            | see             |

  Scenario Outline: Edit abilities check
  Given I am logged in as a "<user>" for organization_id <organization_id>
  And the following team exists:
  | name          | organization_id |
  | viewable team | 1000            |
  And I <do_i_own_it> the "Team"
  When I am on the "Teams" page
  And I should <should_i_see_it> "edit"
  
  Scenarios:
  | user     | organization_id | do_i_own_it | should_i_see_it |
  | User     | 1000            | own         | see             |
  | User     | 1000            | don't own   | not see         |
  | Admin    | 1000            | own         | see             |
  | Admin    | 1000            | don't own   | see             |
  | Operator | 1000            | own         | see             |
  | Operator | 1000            | don't own   | see             |
  | Operator | 100             | don't own   | see             |
