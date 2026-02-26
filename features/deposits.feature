Feature: Deposits
  As a bank customer
  I want to deposit money into my account
  So that I can increase my account balance

  Scenario: Deposit cash into a checking account
    Given I am an authenticated customer
    And I have a checking account with a balance of $100.00
    When I deposit $50.00 into the checking account
    Then the checking account balance is $150.00

  Scenario: Deposit cash into a savings account
    Given I am an authenticated customer
    And I have a savings account with a balance of $200.00
    When I deposit $100.00 into the savings account
    Then the savings account balance is $300.00

  Scenario: Attempt to deposit a negative amount
    Given I am an authenticated customer
    And I have a checking account with a balance of $100.00
    When I deposit -$50.00 into the checking account
    Then the request is denied
    And I receive an error message "Deposit amount must be greater than zero"

  Scenario: Attempt to deposit zero
    Given I am an authenticated customer
    And I have a checking account with a balance of $100.00
    When I deposit $0.00 into the checking account
    Then the request is denied
    And I receive an error message "Deposit amount must be greater than zero"
