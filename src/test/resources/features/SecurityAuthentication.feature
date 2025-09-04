@security
Feature: Authentication Security Tests

  @negative
  Scenario: Access API with invalid username
    Given I make a request to get all books with invalid username
    Then Validate status code is 401

  @negative
  Scenario: Access API with invalid password
    Given I make a request to get all books with invalid password
    Then Validate status code is 401

  @negative
  Scenario: Access API with empty credentials
    Given I make a request to get all books with empty credentials
    Then Validate status code is 401


  @negative
  Scenario: Access API without authentication
    Given I make a request to get all books without authentication
    Then Validate status code is 401