Feature: Transfers
  As a bank customer
  I want to transfer money between my accounts
  So that I can manage my funds across accounts

  Scenario: Transfer funds between two accounts
    Given I am an authenticated customer
    And I have a checking account with a balance of $500.00
    And I have a savings account with a balance of $200.00
    When I transfer $100.00 from the checking account to the savings account
    Then the checking account balance is $400.00
    And the savings account balance is $300.00

  Scenario: Attempt to transfer more than the available balance
    Given I am an authenticated customer
    And I have a checking account with a balance of $50.00
    And I have a savings account with a balance of $200.00
    When I transfer $100.00 from the checking account to the savings account
    Then the request is denied
    And I receive an error message "Insufficient funds"
    And the checking account balance is $50.00
    And the savings account balance is $200.00

  Scenario: Attempt to transfer zero
    Given I am an authenticated customer
    And I have a checking account with a balance of $500.00
    And I have a savings account with a balance of $200.00
    When I transfer $0.00 from the checking account to the savings account
    Then the request is denied
    And I receive an error message "Transfer amount must be greater than zero"

  Scenario: Attempt to transfer a negative amount
    Given I am an authenticated customer
    And I have a checking account with a balance of $500.00
    And I have a savings account with a balance of $200.00
    When I transfer -$50.00 from the checking account to the savings account
    Then the request is denied
    And I receive an error message "Transfer amount must be greater than zero"

  Scenario: Attempt to transfer to the same account
    Given I am an authenticated customer
    And I have a checking account with a balance of $500.00
    When I transfer $100.00 from the checking account to the checking account
    Then the request is denied
    And I receive an error message "Source and destination accounts must be different"
