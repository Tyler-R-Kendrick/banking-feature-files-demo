Feature: Account Management
  As a bank customer
  I want to manage my bank accounts
  So that I can organize my finances

  Scenario: Open a new checking account
    Given I am an authenticated customer
    When I request to open a new checking account
    Then a new checking account is created for me
    And the account balance is $0.00

  Scenario: Open a new savings account
    Given I am an authenticated customer
    When I request to open a new savings account
    Then a new savings account is created for me
    And the account balance is $0.00

  Scenario: Close an existing account with zero balance
    Given I am an authenticated customer
    And I have a checking account with a balance of $0.00
    When I request to close the checking account
    Then the checking account is closed
    And the account is no longer accessible

  Scenario: Attempt to close an account with a non-zero balance
    Given I am an authenticated customer
    And I have a checking account with a balance of $100.00
    When I request to close the checking account
    Then the request is denied
    And I receive an error message "Account must have a zero balance before closing"
