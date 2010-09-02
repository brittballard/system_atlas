Feature: User registers for the site
  In order to use the site
  As a customer
  I need to be able to register for a login
  
  Scenario: A user registers with an existing organization
    Given I am on the registration page
    And the following organizations exist:
    |name         |registration_code|
    |"Britt's org"|"ABCDEFG"        |
    When I fill in the following:
    |registration_code |ABCDEFG |
    And I press "Continue"
    And I fill in the following:
    |Login                  |Britton                        |
    |Email                  |davidbritton.ballard@gmail.com |
    |Password               |dallas_texas                   |
    |Password confirmation  |dallas_texas                   |
    And I check "user_roles_"
    And I press "Register"
    Then I should see "Account registered!"
    