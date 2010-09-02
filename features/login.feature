Feature: User logs in
  In order to user the site
  As an authenticated user
  I need to be able to login to the site

  Scenario: Successful login
    Given I go to the login page
    And I am logged in as an "Admin"
    Then I should see "Login successful!"
