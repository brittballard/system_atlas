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
  And The entity and definition organizations for the "Database Server" should be the same
  
  Scenario: Successful update of a database server
  Given I am logged in as an "Admin" for organization_id 1000
  And the following database server exists:
  | name                    | description        | id | organization_id |
  | database server to edit | my big description | 43 | 1000            |
  And I am on the "DatabaseServers" page
  And I follow "edit"
  When I fill in the following:
  | database_server_name        | edited name        |
  | database_server_description | edited description |
  And I press "edit"
  Then I should see "Database Server updated successfully."
  And I should have a "DatabaseServer" like
  | name            | edited name        |
  | description     | edited description |
  | organization_id | 1000               |
  | id              | 43                 |

  Scenario Outline: Admin, operator, and user read abilities check
  Given I am logged in as a "<user>" for organization_id <organization_id>
  And the following database server exists:
  | name                     | organization_id |
  | viewable database server | 1000            |
  When I am on the "DatabaseServers" page
  Then I should <should_i_see_it> "viewable database server"
  
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
  And the following database server exists:
  | name                     | organization_id |
  | viewable database server | 1000            |
  And I <do_i_own_it> the "DatabaseServer"
  When I am on the "DatabaseServers" page
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
