Feature: Withdrawals
  As a bank customer
  I want to withdraw money from my account
  So that I can access my funds

  Scenario: Withdraw from a checking account with sufficient funds
    Given I am an authenticated customer
    And I have a checking account with a balance of $200.00
    When I withdraw $50.00 from the checking account
    Then the checking account balance is $150.00

  Scenario: Withdraw full balance from a savings account
    Given I am an authenticated customer
    And I have a savings account with a balance of $100.00
    When I withdraw $100.00 from the savings account
    Then the savings account balance is $0.00

  Scenario: Attempt to withdraw more than the available balance
    Given I am an authenticated customer
    And I have a checking account with a balance of $50.00
    When I withdraw $100.00 from the checking account
    Then the request is denied
    And I receive an error message "Insufficient funds"

  Scenario: Attempt to withdraw zero
    Given I am an authenticated customer
    And I have a checking account with a balance of $100.00
    When I withdraw $0.00 from the checking account
    Then the request is denied
    And I receive an error message "Withdrawal amount must be greater than zero"

  Scenario: Attempt to withdraw a negative amount
    Given I am an authenticated customer
    And I have a checking account with a balance of $100.00
    When I withdraw -$20.00 from the checking account
    Then the request is denied
    And I receive an error message "Withdrawal amount must be greater than zero"
