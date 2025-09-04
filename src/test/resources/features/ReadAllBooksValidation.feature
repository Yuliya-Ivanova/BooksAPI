 @getBooks
Feature: Read all books validation

  @positive
  Scenario: Get a list of all books
    When Get All Books
    Then Validate status code is 200
    And Validate all books response structure
