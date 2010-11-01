@portfolio @portfolio-manage @portfolio-entries
Feature: Manage Portfolio
  In order to add a portfolio section to my website
  As an administrator
  I want to create and manage portfolio entries

  Background:
    Given I am a logged in refinery user
    And I have no portfolio entries

  @portfolio-list @list
  Scenario: Portfolio Entries List
    Given I have portfolio entries titled Home, About
    When I go to the list of portfolio entries
    Then I should see "Home"
    And I should see "About"

  @portfolio-valid @valid
  Scenario: Add Valid Portfolio Entry
    When I go to the list of portfolio entries
    And I follow "Add New Portfolio Entry"
    And I fill in "portfolio_entry_title" with "Portfolios are useful to show off my work"
    And I press "Save"
    Then I should see "'Portfolios are useful to show off my work' was successfully added."
    And I should have 1 portfolio entries

  @portfolio-invalid @invalid
  Scenario: Add Invalid Portfolio Entry (without title)
    When I go to the list of portfolio entries
    And I follow "Add New Portfolio Entry"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 portfolio entries

  @portfolio-edit @edit
  Scenario: Edit Existing Portfolio Entry
    Given I have portfolio entries titled Home
    And I go to the list of portfolio entries
    And I follow "Edit this entry"
    And I fill in "portfolio_entry_title" with "Away"
    And I press "Save"
    Then I should see "'Away' was successfully updated."
    And I should not see "Home"
    And I should have 1 portfolio entries

  @portfolio-delete @delete
  Scenario: Delete Portfolio Entry
    Given I only have a portfolio entry titled "test"
    When I go to the list of portfolio entries
    And I follow "Remove this entry forever"
    Then I should see "'test' was successfully removed."
    And I should have 0 portfolio entries
