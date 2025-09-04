@createBook
Feature: Create Book validation

  @positive @smoke
  @after_deleteBook
  Scenario: Create a new book with valid data
    Given I have valid book data:
      | name        | Test name        |
      | author      | Test author      |
      | publication | Test publication |
      | category    | Test category    |
      | pages       | 180              |
      | price       | 12.99            |
    When I create a new book
    Then Validate status code is 200
    And the response should contain a single book object
    And the book should have all required fields
    And all book fields should have correct data types
    And the book ID should be auto-generated
    And the response should contain the created book object

    When I get just created book by ID
    Then Validate status code is 200

  @positive
  @after_deleteBook
  Scenario: Create a book with minimum valid data
    Given I have valid book data:
      | name        | A    |
      | author      | B    |
      | publication | C    |
      | category    | D    |
      | pages       | 1    |
      | price       | 0.01 |
    When I create a new book
    Then Validate status code is 200
    And the response should contain the created book object

  @positive
  @after_deleteBook
  Scenario: Create a book with maximum valid data
    Given I have valid book data:
      | name        | Test name with very loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong |
      | author      | Test author with a very long name that contains multiple words and should be valid                                      |
      | publication | Test publication with Long Name                                                                                         |
      | category    | Test category with Long Name                                                                                            |
      | pages       | 9999                                                                                                                    |
      | price       | 999.99                                                                                                                  |
    When I create a new book
    Then Validate status code is 200
    And the response should contain the created book object

  @negative
  Scenario: Create a book with missing name field
    Given I have invalid book data:
      | author      | Test author      |
      | publication | Test publication |
      | category    | Test category    |
      | pages       | 180              |
      | price       | 12.99            |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with missing author field
    Given I have invalid book data:
      | name        | Test name        |
      | publication | Test publication |
      | category    | Test category    |
      | pages       | 180              |
      | price       | 12.99            |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with missing publication field
    Given I have invalid book data:
      | name     | Test name     |
      | author   | Test author   |
      | category | Test category |
      | pages    | 180           |
      | price    | 12.99         |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with missing category field
    Given I have invalid book data:
      | name        | Test name        |
      | author      | Test author      |
      | publication | Test publication |
      | pages       | 180              |
      | price       | 12.99            |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with missing pages field
    Given I have invalid book data:
      | name        | Test name        |
      | author      | Test author      |
      | publication | Test publication |
      | category    | Test category    |
      | price       | 12.99            |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with missing price field
    Given I have invalid book data:
      | name        | Test name        |
      | author      | Test author      |
      | publication | Test publication |
      | category    | Test category    |
      | pages       | 180              |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with empty name
    Given I have invalid book data:
      | name        |                  |
      | author      | Test author      |
      | publication | Test publication |
      | category    | Test category    |
      | pages       | 180              |
      | price       | 12.99            |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with invalid pages - negative number
    Given I have invalid book data:
      | name        | Test name        |
      | author      | Test author      |
      | publication | Test publication |
      | category    | Test category    |
      | pages       | -1               |
      | price       | 12.99            |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with invalid pages - zero
    Given I have invalid book data:
      | name        | Test name        |
      | author      | Test author      |
      | publication | Test publication |
      | category    | Test category    |
      | pages       | 0                |
      | price       | 12.99            |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with invalid price - negative number
    Given I have invalid book data:
      | name        | Test name        |
      | author      | Test author      |
      | publication | Test publication |
      | category    | Test category    |
      | pages       | 180              |
      | price       | -5.99            |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with invalid price - zero
    Given I have invalid book data:
      | name        | Test name        |
      | author      | Test author      |
      | publication | Test publication |
      | category    | Test category    |
      | pages       | 180              |
      | price       | 0                |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with invalid data types - pages as string
    Given I have invalid book data:
      | name        | Test name          |
      | author      | Test author        |
      | publication | Test publication   |
      | category    | Test category      |
      | pages       | one hundred eighty |
      | price       | 12.99              |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with invalid data types - price as string
    Given I have invalid book data:
      | name        | Test name        |
      | author      | Test author      |
      | publication | Test publication |
      | category    | Test category    |
      | pages       | 180              |
      | price       | twelve dollars   |
    When I create a new book with invalid data
    Then Validate status code is 400

  @negative
  Scenario: Create a book with empty request body
    Given I have an empty book data
    When I create a new book
    Then Validate status code is 400

  @negative
  Scenario: Create a book with malformed JSON
    When I create a new book with malformed data
    Then Validate status code is 400

  @boundary
  @after_deleteBook
  Scenario: Create a book with very long name field
    Given I have valid book data:
      | name        | Test name looooooo0000oooooo00000000oooooooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooooooo0000oooooo00000000ooooooooooong value |
      | author      | Test author                                                                                                                                                                                                                       |
      | publication | Test publication                                                                                                                                                                                                                  |
      | category    | Test category                                                                                                                                                                                                                     |
      | pages       | 180                                                                                                                                                                                                                               |
      | price       | 12.99                                                                                                                                                                                                                             |
    When I create a new book
    Then Validate status code is 200

  @boundary
  @after_deleteBook
  Scenario: Create a book with maximum pages value
    Given I have valid book data:
      | name        | Test name        |
      | author      | Test author      |
      | publication | Test publication |
      | category    | Test category    |
      | pages       | 2147483647       |
      | price       | 12.99            |
    When I create a new book
    Then Validate status code is 200

  @boundary
  @after_deleteBook
  Scenario: Create a book with maximum price value
    Given I have valid book data:
      | name        | Test name        |
      | author      | Test author      |
      | publication | Test publication |
      | category    | Test category    |
      | pages       | 180              |
      | price       | 999999.99        |
    When I create a new book
    Then Validate status code is 200
