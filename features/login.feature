Feature: Login
  As a bank customer
  I want to log in to my account
  So that I can securely access my banking services

  Scenario: Successful login with valid credentials
    Given I am a registered customer with username "john.doe" and password "P@ssw0rd"
    When I log in with username "john.doe" and password "P@ssw0rd"
    Then I am authenticated
    And I am redirected to my account dashboard

  Scenario: Failed login with incorrect password
    Given I am a registered customer with username "john.doe" and password "P@ssw0rd"
    When I log in with username "john.doe" and password "wrongpassword"
    Then the login fails
    And I receive an error message "Invalid username or password"

  Scenario: Failed login with unknown username
    Given no account exists for username "unknown.user"
    When I log in with username "unknown.user" and password "P@ssw0rd"
    Then the login fails
    And I receive an error message "Invalid username or password"

  Scenario: Account locked after too many failed login attempts
    Given I am a registered customer with username "john.doe" and password "P@ssw0rd"
    And I have failed to log in 4 consecutive times
    When I log in with username "john.doe" and password "wrongpassword"
    Then the login fails
    And my account is locked
    And I receive an error message "Account locked due to too many failed login attempts"

  Scenario: Logout successfully
    Given I am an authenticated customer
    When I log out
    Then I am no longer authenticated
    And I am redirected to the login page
