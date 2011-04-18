Feature: User creates and maintains application servers
  In order to create system atlases
  As a customer
  I need to be able to create and maintain my application servers
  
  Scenario: Successful creation of a new application server
  Given I am logged in as an "Admin" for organization_id 1000
  And the following software exists:
  | version | licenses | name    | id  |
  | 1       | 123      | Windows | 100 |
  And I am on the new "Application Server" page
  When I fill in the following:
  | application_server_name        | britton's application server        |
  | application_server_description | this is one sexy application server |
  And I select "Windows" from "application_server_web_server_id"
  And I press "create"
  Then I should see "Application Server created successfully."
  And I should have an "Application Server" like
  | name            | britton's application server        |
  | description     | this is one sexy application server |
  | web_server_id   | 100                                 |
  | organization_id | 1000                                |
