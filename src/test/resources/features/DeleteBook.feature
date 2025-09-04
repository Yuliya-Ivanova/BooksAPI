@deleteBook
Feature: Delete Book validation

  @positive @smoke
  @before_createBook
  Scenario: Successfully delete an existing book
    When I delete the book by ID
    Then Validate status code is 200

    When I get just deleted book by ID
    Then Validate status code is 404

  @negative
  Scenario: Attempt to delete a non-existent book
    When I delete the book by ID "99999"
    Then Validate status code is 404

  @negative
  Scenario: Attempt to delete a book with invalid ID format
    When I delete the book by ID "abc123"
    Then Validate status code is 400

  @negative
  Scenario: Attempt to delete a book with negative ID
    When I delete the book by ID "-1"
    Then Validate status code is 400

  @negative
  Scenario: Attempt to delete a book with zero ID
    When I delete the book by ID "0"
    Then Validate status code is 400

  @negative
  Scenario: Attempt to delete a book with empty ID
    When I delete the book by ID " "
    Then Validate status code is 405

  @edge_case
  @before_createBook
  Scenario: Verify that already deleted book cannot be deleted
    When I delete the book by ID
    Then Validate status code is 200

    When I delete the book by ID
    Then Validate status code is 404

  @edge_case
  @before_createBook
  Scenario: Verify book deletion with valid id and spaces before and after id
    When I delete the book by ID with spaces before and after id
    Then Validate status code is 200

    When I get just deleted book by ID
    Then Validate status code is 404

