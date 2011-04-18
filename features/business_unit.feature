Feature: User creates and maintains business units
  In order to create system atlases
  As a customer
  I need to be able to create and maintain my business units
  
  Scenario: Successful creation of a new business unit
  Given I am logged in as an "Admin"
  And I am on the new "Business Unit" page
  When I fill in the following:
  | business_unit_name        | britton's business unit        |
  | business_unit_description | this is one sexy business unit |
  And I press "create"
  Then I should see "Business Unit created successfully."
  And I should have an "Business Unit" like
  | name            | britton's business unit        |
  | description     | this is one sexy business unit |
  | organization_id | 1000                           |
