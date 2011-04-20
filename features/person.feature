Feature: User creates and maintains people
  In order to create system atlases
  As a customer
  I need to be able to create and maintain my people
  
  Scenario: Successful creation of a new person
  Given I am logged in as an "Admin" for organization_id 1000
  And I am on the new "Person" page
  And the following user exists:
  | email                          | organization_id | id |
  | davidbritton.ballard@gmail.com | 1000            | 47 |
  When I fill in the following:
  | person_first_name | britton                        |
  | person_last_name  | ballard                        |
  | person_email      | davidbritton.ballard@gmail.com |
  And I check "person_is_owner"
  And I press "create"
  Then I should see "Person created successfully."
  And I should have a "Person" like
  | first_name      | britton |
  | last_name       | ballard |
  | is_owner        | 1       |
  | organization_id | 1000    |
  | user_id         | 47      |
  And The entity and definition organizations for the "Person" should be the same

  Scenario: Successful update of a person
  Given I am logged in as an "Admin" for organization_id 1000
  And I am on the "People" page
  And I follow "edit"
  When I fill in the following:
  | person_first_name | edited first name |
  | person_last_name  | edited last name  |
  And I press "edit"
  Then I should see "Person updated successfully."
  And I should have a "Person" like
  | first_name      | edited first name |
  | last_name       | edited last name  |
  | organization_id | 1000              |

  Scenario Outline: Edit abilities check
  Given I am logged in as a "<user>" for organization_id <organization_id>
  And the following person exists:
  | first_name      | organization_id |
  | viewable person | 1000            |
  When I am on the "People" page
  And I should <should_i_see_it> "none"
  
  Scenarios:
  | user     | organization_id | do_i_own_it | should_i_see_it |
  | User     | 1000            | don't own   | see             |
  | Admin    | 1000            | own         | not see         |
  | Admin    | 1000            | don't own   | not see         |
  | Operator | 1000            | own         | not see         |
  | Operator | 1000            | don't own   | not see         |
