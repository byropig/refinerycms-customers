@customers
Feature: Customers
  In order to have customers on my website
  As an administrator
  I want to manage customers

  Background:
    Given I am a logged in refinery user
    And I have no customers

  @customers-list @list
  Scenario: Customers List
   Given I have customers titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of customers
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @customers-valid @valid
  Scenario: Create Valid Customer
    When I go to the list of customers
    And I follow "Add New Customer"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 customer

  @customers-invalid @invalid
  Scenario: Create Invalid Customer (without name)
    When I go to the list of customers
    And I follow "Add New Customer"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 customers

  @customers-edit @edit
  Scenario: Edit Existing Customer
    Given I have customers titled "A name"
    When I go to the list of customers
    And I follow "Edit this customer" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of customers
    And I should not see "A name"

  @customers-duplicate @duplicate
  Scenario: Create Duplicate Customer
    Given I only have customers titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of customers
    And I follow "Add New Customer"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 customers

  @customers-delete @delete
  Scenario: Delete Customer
    Given I only have customers titled UniqueTitleOne
    When I go to the list of customers
    And I follow "Remove this customer forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 customers
 