Feature: User registers for the site
  In order to use the site
  As a customer
  I need to be able to register for a login
  
  Scenario: A user registers with an existing organization
    Given I am on the registration page
    And the following organization exists:
    |name         |id |
    |"Britt's org"|100|
    When I fill in the following:
    |user_email                   |davidbritton.ballard@gmail.com |
    |user_password                |dallas_texas                   |
    |user_password_confirmation   |dallas_texas                   |
    |user_organization_id         |100                            |
    And I press "Register"
    Then I should see "Welcome! You have signed up successfully."
    