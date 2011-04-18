Feature: User creates and maintains people
  In order to create system atlases
  As a customer
  I need to be able to create and maintain my people
  
  Scenario: Successful creation of a new person
  Given I am logged in as an "Admin"
  And I am on the new "Person" page
  When I fill in the following:
  | person_first_name | britton                        |
  | person_last_name  | ballard                        |
  | person_email      | davidbritton.ballard@gmail.com |
  And I check "person_is_owner"
  And I press "create"
  Then I should see "Person created successfully."
  And I should have an "Person" like
  | first_name      | britton |
  | last_name       | ballard |
  | is_owner        | 1       |
  | organization_id | 1000    |
