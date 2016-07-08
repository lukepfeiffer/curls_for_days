Feature: User

  Scenario: User signs up
    Given I am on the "users/new" page
    And I fill in "user_email" with "email@example.com"
    And I fill in "user_email" with "email@example.com"
    And I fill in "user_username" with "username"
    And I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "password"
    And I press "Sign Up"
    Then I should be on the "/" page
    And I should see "Sign Up Successful"

  Scenario: User signs in
    Given the following user:
      | email    | email@example.com |
      | username | username          |
      | password | password          |
    And I am on the "users/new" page
    When I fill in "session_email" with "email@example.com"
    And I fill in "password" with "password"
    And I press "Sign In"

  Scenario: User signs out
    Given I am on the "/" page
    And I follow "Sign Out"
    Then I should see "Signed Out!"
