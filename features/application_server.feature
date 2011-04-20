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
  And The entity and definition organizations for the "Application Server" should be the same
  
  Scenario: Successful update of a application server
  Given I am logged in as an "Admin" for organization_id 1000
  And the following application server exists:
  | name                       | description        | id | organization_id |
  | application server to edit | my big description | 43 | 1000            |
  And I am on the "ApplicationServers" page
  And I follow "edit"
  When I fill in the following:
  | application_server_name        | edited name        |
  | application_server_description | edited description |
  And I press "edit"
  Then I should see "Application Server updated successfully."
  And I should have a "ApplicationServer" like
  | name            | edited name        |
  | description     | edited description |
  | organization_id | 1000               |
  | id              | 43                 |

  Scenario Outline: Admin, operator, and user read abilities check
  Given I am logged in as a "<user>" for organization_id <organization_id>
  And the following application server exists:
  | name                        | organization_id |
  | viewable application server | 1000            |
  When I am on the "ApplicationServers" page
  Then I should <should_i_see_it> "viewable application server"
  
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
  And the following application server exists:
  | name                        | organization_id |
  | viewable application server | 1000            |
  And I <do_i_own_it> the "ApplicationServer"
  When I am on the "ApplicationServers" page
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
