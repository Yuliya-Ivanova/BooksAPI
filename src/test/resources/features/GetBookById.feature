@getBookById
Feature: Get Book by ID validation

  @positive @smoke
  Scenario: Get existing book by valid ID
    When I get a book by ID "11232"
    Then Validate status code is 200
    And the response should contain a single book object
    And the book should have all required fields
    And all book fields should have correct data types

  @positive
  Scenario: Get existing book by valid ID and with spaces before and after ID
    When I get a book by ID "  11232  "
    Then Validate status code is 200

  @negative
  Scenario: Get book by non-existent ID
    When I get a book by ID "1"
    Then Validate status code is 404

  @negative
  Scenario: Get book by invalid ID format - string
    When I get a book by ID "invalid"
    Then Validate status code is 400

  @negative
  Scenario: Get book by negative ID
    When I get a book by ID "-1"
    Then Validate status code is 400

  @negative
  Scenario: Get book by zero ID
    When I get a book by ID "0"
    Then Validate status code is 404

  @negative
  Scenario: Get book by decimal ID
    When I get a book by ID "1.5"
    Then Validate status code is 400

  @boundary
  Scenario: Get book by very large ID
    When I get a book by ID "2147483647"
    Then Validate status code is 404
