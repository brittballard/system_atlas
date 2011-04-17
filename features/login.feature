Feature: User logs in
  In order to user the site
  As an authenticated user
  I need to be able to login to the site

  Scenario Outline: Successful login
    Given I go to the login page
    And I am logged in as an "<role>"
    Then I should see "Signed in successfully."

  Scenarios: Login as different roles
    | role     |
    | operator |
    | admin    |
    | user     |
