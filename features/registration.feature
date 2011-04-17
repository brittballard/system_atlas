Feature: User registers for the site
  In order to use the site
  As a customer
  I need to be able to register for a login

  Scenario: Successful registration
    Given I am on the registration page
    And the following organization exists:
    | name          | id  |
    | "Britt's org" | 100 |
    When I fill in the following:
    | user_email                 | a@a.com |
    | user_password              | britton |
    | user_password_confirmation | britton |
    | user_organization_id       | 100     |
    And I press "Register"
    Then I should see "Welcome! You have signed up successfully."
    And I should find a Person record with email "a@a.com" and organization_id 100

  Scenario Outline: Failed registration
    Given I am on the registration page
    And the following organization exists:
    | name          | id                |
    | "Britt's org" | <organization_id> |
    When I fill in the following:
    | user_email                 | <email>                       |
    | user_password              | <password>                    |
    | user_password_confirmation | <password_confirmation>       |
    | user_organization_id       | <user_entered_organiztion_id> |
    And I press "Register"
    Then I should see "<result>"

  Scenarios:
    | email                          | organization_id | user_entered_organiztion_id | password     | password_confirmation | result                                          |
    | davidbritton.ballard@gmail.com | 100             | 1                           | dallas_texas | dallas_texas          | Invalid organization.                           |
    | xyz                            | 100             | 1                           | dallas_texas | dallas_texas          | Email is invalid                                |
    | davidbritton.ballard@gmail.com | 100             | 100                         | a            | a                     | Password is too short (minimum is 6 characters) |
    | davidbritton.ballard@gmail.com | 100             | 100                         | cassie       | britton               | Password doesn't match confirmation             |
