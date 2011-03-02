Feature: User registers for the site
  In order to use the site
  As a customer
  I need to be able to register for a login
  
  Scenario: A user registers with an existing organization
    Given I am on the registration page
    And the following organization exists:
    |name         |registration_code|
    |"Britt's org"|100              |
    When I fill in the following:
    |Email                  |davidbritton.ballard@gmail.com |
    |Password               |dallas_texas                   |
    |Password confirmation  |dallas_texas                   |
    |registration_code      |100                            |
    And I press "Register"
    Then I should see "Account registered!"
    