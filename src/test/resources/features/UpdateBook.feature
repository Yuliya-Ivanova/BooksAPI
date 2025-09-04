@updateBook
Feature: Update Book validation

  @positive @smoke
  @before_createBook @after_deleteBook
  Scenario: Update a book with valid data
    Given I have valid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 200                      |
      | price       | 15.99                    |
    When I update the book
    Then Validate status code is 200
    And the response should contain a single book object
    And the book should have all required fields
    And all book fields should have correct data types
    And the book ID should remain unchanged
    And the response should contain the updated book object

  @positive
  @before_createBook @after_deleteBook
  Scenario: Update a book with minimum valid data
    Given I have valid book data for update:
      | name        | A    |
      | author      | B    |
      | publication | C    |
      | category    | D    |
      | pages       | 1    |
      | price       | 0.01 |
    When I update the book
    Then Validate status code is 200
    And the response should contain the updated book object

  @positive
  @before_createBook @after_deleteBook
  Scenario: Update a book with maximum valid data
    Given I have valid book data for update:
      | name        | Updated name with very loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong          |
      | author      | Updated author with a very loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong name |
      | publication | Updated publication with loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Name   |
      | category    | Updated category with loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Name      |
      | pages       | 9999                                                                                                                                |
      | price       | 999.99                                                                                                                              |
    When I update the book
    Then Validate status code is 200
    And the response should contain the updated book object

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with missing name field
    Given I have invalid book data for update:
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 10                       |
      | price       | 15.99                    |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with missing author field
    Given I have invalid book data for update:
      | name        | Updated Test name        |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 200                      |
      | price       | 15.99                    |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with missing publication field
    Given I have invalid book data for update:
      | name     | Updated Test name     |
      | author   | Updated Test author   |
      | category | Updated Test category |
      | pages    | 200                   |
      | price    | 15.99                 |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with missing category field
    Given I have invalid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | pages       | 200                      |
      | price       | 15.99                    |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with missing pages field
    Given I have invalid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | price       | 15.99                    |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with missing price field
    Given I have invalid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 200                      |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with empty name
    Given I have invalid book data for update:
      | name        |                          |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 200                      |
      | price       | 15.99                    |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with invalid pages - negative number
    Given I have invalid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | -1                       |
      | price       | 15.99                    |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with invalid pages - zero
    Given I have invalid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 0                        |
      | price       | 15.99                    |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with invalid price - negative number
    Given I have invalid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 200                      |
      | price       | -5.99                    |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with invalid price - zero
    Given I have invalid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 200                      |
      | price       | 0                        |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with invalid data types - pages as string
    Given I have invalid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | two hundred              |
      | price       | 15.99                    |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with invalid data types - price as string
    Given I have invalid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 200                      |
      | price       | fifteen dollars          |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with empty request body
    Given I have an empty book data for update
    When I update the book
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with malformed JSON
    Given I update the book with malformed data
    Then Validate status code is 400

  @negative
  Scenario: Update a non-existent book
    Given I have valid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 200                      |
      | price       | 15.99                    |
    When I update book with id "1"
    Then Validate status code is 404

  @negative
  Scenario: Update a book with invalid book ID format
    Given I have valid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 200                      |
      | price       | 15.99                    |
    When I update book with id "abc"
    Then Validate status code is 400

  @boundary
  @before_createBook @after_deleteBook
  Scenario: Update a book with very long name field
    And I have valid book data for update:
      | name        | Updated name looooooo0000oooooo00000000oooooooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooong value       |
      | author      | Updated Test looooooo0000oooooo00000000oooooooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooong author      |
      | publication | Updated Test looooooo0000oooooo00000000oooooooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooong publication |
      | category    | Updated Test looooooo0000oooooo00000000oooooooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooong category    |
      | pages       | 10                                                                                                                                                                                                                                         |
      | price       | 15.99                                                                                                                                                                                                                                      |
    When I update the book
    Then Validate status code is 200
    And the response should contain the updated book object

  @boundary
  @before_createBook @after_deleteBook
  Scenario: Update a book with maximum pages value
    Given I have valid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 2147483647               |
      | price       | 15.99                    |
    When I update the book
    Then Validate status code is 200
    And the response should contain the updated book object

  @boundary
  @before_createBook @after_deleteBook
  Scenario: Update a book with maximum price value
    Given I have valid book data for update:
      | name        | Updated Test name        |
      | author      | Updated Test author      |
      | publication | Updated Test publication |
      | category    | Updated Test category    |
      | pages       | 10                       |
      | price       | 999999.99                |
    When I update the book
    Then Validate status code is 200
    And the response should contain the updated book object

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with partial data - only name
    Given I have invalid book data for update:
      | name | Updated Test name |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with partial data - only author
    Given I have invalid book data for update:
      | author | Updated Test author |
    When I update the book with invalid data
    Then Validate status code is 400

  @negative
  @before_createBook @after_deleteBook
  Scenario: Update a book with null values
    Given I have invalid book data for update:
      | name        | null |
      | author      | null |
      | publication | null |
      | category    | null |
      | pages       | null |
      | price       | null |
    When I update the book with invalid data
    Then Validate status code is 400
