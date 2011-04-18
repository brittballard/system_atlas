Feature: User creates and maintains database servers
  In order to create system atlases
  As a customer
  I need to be able to create and maintain my database servers
  
  Scenario: Successful creation of a new database server
  Given I am logged in as an "Admin" for organization_id 1000
  And the following software exists:
  | version | licenses | name   | id  |
  | 1       | 123      | Oracle | 100 |
  And I am on the new "Database Server" page
  When I fill in the following:
  | database_server_name        | britton's database server        |
  | database_server_description | this is one sexy database server |
  And I select "Oracle" from "database_server_database_software_id"
  And I press "create"
  Then I should see "Database Server created successfully."
  And I should have a "Database Server" like
  | name                 | britton's database server        |
  | description          | this is one sexy database server |
  | database_software_id | 100                              |
  | organization_id      | 1000                             |
