Feature: Balance Inquiry
  As a bank customer
  I want to check the balance of my accounts
  So that I know how much money I have available

  Scenario: View balance of a checking account
    Given I am an authenticated customer
    And I have a checking account with a balance of $350.00
    When I request the balance of the checking account
    Then I see a balance of $350.00

  Scenario: View balance of a savings account
    Given I am an authenticated customer
    And I have a savings account with a balance of $1200.00
    When I request the balance of the savings account
    Then I see a balance of $1200.00

  Scenario: View balances of all accounts
    Given I am an authenticated customer
    And I have a checking account with a balance of $350.00
    And I have a savings account with a balance of $1200.00
    When I request balances for all my accounts
    Then I see the checking account balance of $350.00
    And I see the savings account balance of $1200.00

  Scenario: Attempt to view balance of an account that does not belong to the customer
    Given I am an authenticated customer
    And another customer has an account
    When I request the balance of the other customer's account
    Then the request is denied
    And I receive an error message "Account not found"
