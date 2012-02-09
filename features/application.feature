Feature: User creates and maintains applications
  In order to create system atlases
  As a customer
  I need to be able to create and maintain my applications
  
  Scenario: Successful creation of a new Applications
  Given I am logged in as an "Admin" for organization_id 1000
  And I am on the new "Application" page
  When I fill in the following:
  | application_name        | britton's application      |
  | application_description | this is a nice application |
  And I press "create"
  Then I should see "Application created successfully."
  And I should have an "Application" like
  | name            | britton's application      |
  | description     | this is a nice application |
  | organization_id | 1000                       |
  And The entity and definition organizations for the "Application" should be the same

  Scenario: I should be able to view the applications related to an application
  Given I am logged in as an "Admin" for organization_id 1000
  And the following application exists:
  | name                  | description | organization_id |
  | britton's application | nice app    | 1000            |
  And the following application exists:
  | name                 | description   | organization_id |
  | dipesh's application | REAL nice app | 1000            |
  And I am on the home page
  And "britton's application" and "dipesh's application" are related
  When I follow "Relationships"
  Then I should see "Related Applications"
  And I should see "dipesh's application"

  @under_development
  Scenario: I should be able to view the applications related to an application
  Given I am logged in as an "Admin" for organization_id 1000
  And the following application exists:
  | name                  | description | organization_id |
  | britton's application | nice app    | 1000            |
  And the following application exists:
  | name                 | description   | organization_id |
  | dipesh's application | REAL nice app | 1000            |
  And I am on the home page
  And "britton's application" and "dipesh's application" are related
  When I follow "Relationships"
  Then I should see "Manage Relationships"