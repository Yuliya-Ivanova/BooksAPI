# Test Report

## Executive Summary

This report analyzes test results from 5 multiple test runs of the Books API testing suite. The analysis reveals consistent patterns of failures across different endpoints, indicating systematic issues with the API implementation.

### Overall Test Results Summary
- **Run 1:** 68 tests, 37 failures, 0 errors
- **Run 2:** 68 tests, 35 failures, 1 timeout error  
- **Run 3:** 68 tests, 37 failures, 0 errors
- **Run 4:** 68 tests, 37 failures, 0 errors
- **Run 5:** 68 tests, 37 failures, 0 errors

**Average Failure Rate:** 54.4% (37.2 failures out of 68 tests)

---

## 1. Summary Table - Defects by Endpoint

| Endpoint | Defects                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Frequency |
|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------|
| **Read All Books** | [DEF-001](#def-001-null-name-field-in-get-all-books-response) - Null name field in Get all books response                                                                                                                                                                                                                                                                                                                                                                                                   | 100% |
| **Read a Particular Book by ID** | [DEF-002](#def-002-incorrect-status-code-for-negative-id-in-get-book-by-id) - Incorrect status code for negative ID in Get book by id                                                                                                                                                                                                                                                                                                                                                                               | 100% |
| **Create a Book** | [DEF-003](#def-003-missing-input-validation-for-required-fields-in-create-book) - Missing input validation for required fields<br/>[DEF-004](#def-004-incorrect-status-codes-for-validation-errors-in-create-book) - Incorrect status codes for validation errors<br/>[DEF-005](#def-005-page-count-mismatch-in-created-book-response) - Page Count mismatch in created book response                                                                                                                              | 100%<br/>100%<br/>20% |
| **Update a Book** | [DEF-006](#def-006-missing-input-validation-for-required-fields-in-update-book) - Missing input validation for required fields<br/>[DEF-007](#def-007-incorrect-status-codes-for-validation-errors-in-update-book) - Incorrect status codes for validation errors<br/>[DEF-008](#def-008-page-count-not-properly-updated-in-response) - Page Count not properly updated in response<br/>[DEF-009](#def-009-incorrect-status-code-for-non-existent-book-update) - Incorrect status code for non-existent book | 100%<br/>100%<br/>100%<br/>100% |
| **Delete Book** | [DEF-010](#def-010-inconsistent-status-codes-for-delete-operations) - Inconsistent status codes for delete operations                                                                                                                                                                                                                                                                                                                                                                                  | 60% |

---

## 2. Detailed Defect Information

### DEF-001: Null name field in Get all books response
- **Severity:** High
- **Frequency:** 5/5 runs (100%)
- **HTTP Method:** GET
- **Endpoint:** `/books` (Read all books)
- **Detailed Description:** The API returns a book object with a null name field at index [46] in the books array, causing validation failures when checking for non-null required fields.
- **Steps to Reproduce:**
  1. Send GET request to `/books` endpoint
  2. Parse the response JSON array
  3. Check the name field of book at index [46]
- **Expected Result:** All book objects should have non-null name fields
- **Actual Result:** Book at index [46] has null name field
- **Root Cause:** Data integrity issue in the backend database or data generation process

### DEF-002: Incorrect status code for negative ID in Get book by id
- **Severity:** Medium
- **Frequency:** 5/5 runs (100%)
- **HTTP Method:** GET
- **Endpoint:** `/books/{id}` (Get book by ID)
- **Detailed Description:** When requesting a book with negative ID, the API returns 404 instead of the expected 400 status code for bad request validation.
- **Steps to Reproduce:**
  1. Send GET request to `/books/-1`
  2. Check the response status code
- **Expected Result:** HTTP 400 (Bad Request)
- **Actual Result:** HTTP 404 (Not Found)
- **Root Cause:** Missing input validation for negative ID values

### DEF-003: Missing input validation for required fields in Create Book
- **Severity:** High
- **Frequency:** 5/5 runs (100%)
- **HTTP Method:** POST
- **Endpoint:** `/books` (Create book)
- **Detailed Description:** The API accepts requests with missing required fields (name, author, publication, category, pages, price) and returns 200 or 500 instead of 400 for validation errors.
- **Steps to Reproduce:**
  1. Send POST request to `/books` with missing name field
  2. Send POST request to `/books` with missing author field
  3. Send POST request to `/books` with missing publication field
  4. Send POST request to `/books` with missing category field
  5. Send POST request to `/books` with missing pages field
  6. Send POST request to `/books` with missing price field
  7. Check response status codes
- **Expected Result:** HTTP 400 (Bad Request) for all missing required fields
- **Actual Result:** HTTP 200 for name, pages, price; HTTP 500 for author, publication, category
- **Root Cause:** Inconsistent input validation implementation

### DEF-004: Incorrect status codes for validation errors in Create Book
- **Severity:** High
- **Frequency:** 5/5 runs (100%)
- **HTTP Method:** POST
- **Endpoint:** `/books` (Create book)
- **Detailed Description:** The API returns incorrect status codes for various validation scenarios including empty strings, invalid numeric values, and zero values.
- **Steps to Reproduce:**
  1. Send POST request with empty name field
  2. Send POST request with negative pages value
  3. Send POST request with zero pages value
  4. Send POST request with negative price value
  5. Send POST request with zero price value
- **Expected Result:** HTTP 400 (Bad Request) for all invalid inputs
- **Actual Result:** HTTP 200 (OK) for all invalid inputs
- **Root Cause:** Missing validation logic for input constraints

### DEF-005: Page Count mismatch in created book response
- **Severity:** Medium
- **Frequency:** 1/5 runs (20%)
- **HTTP Method:** POST
- **Endpoint:** `/books` (Create book)
- **Detailed Description:** When creating a book with valid data, the response contains different page count than what was sent in the request.
- **Steps to Reproduce:**
  1. Send POST request to `/books` with pages: 180
  2. Check the response book object pages field
- **Expected Result:** Response should contain pages: 180
- **Actual Result:** Response contains pages: 182
- **Root Cause:** Data processing or storage issue in the backend

### DEF-006: Missing input validation for required fields in Update Book
- **Severity:** High
- **Frequency:** 5/5 runs (100%)
- **HTTP Method:** PUT
- **Endpoint:** `/books/{id}` (Update book)
- **Detailed Description:** The API accepts update requests with missing required fields and returns 200 instead of 400 for validation errors.
- **Steps to Reproduce:**
  1. Send PUT request to `/books/{id}` with missing name field
  2. Send PUT request to `/books/{id}` with missing author field
  3. Send PUT request to `/books/{id}` with missing publication field
  4. Send PUT request to `/books/{id}` with missing category field
  5. Send PUT request to `/books/{id}` with missing pages field
  6. Send PUT request to `/books/{id}` with missing price field
- **Expected Result:** HTTP 400 (Bad Request) for all missing required fields
- **Actual Result:** HTTP 200 (OK) for all missing required fields
- **Root Cause:** Missing input validation in update endpoint

### DEF-007: Incorrect status codes for validation errors in Update Book
- **Severity:** High
- **Frequency:** 5/5 runs (100%)
- **HTTP Method:** PUT
- **Endpoint:** `/books/{id}` (Update book)
- **Detailed Description:** The API returns 200 status code for various invalid input scenarios instead of 400.
- **Steps to Reproduce:**
  1. Send PUT request with empty name field
  2. Send PUT request with negative pages value
  3. Send PUT request with zero pages value
  4. Send PUT request with negative price value
  5. Send PUT request with zero price value
  6. Send PUT request with partial data (only name)
  7. Send PUT request with partial data (only author)
  8. Send PUT request with null values
- **Expected Result:** HTTP 400 (Bad Request) for all invalid inputs
- **Actual Result:** HTTP 200 (OK) for all invalid inputs
- **Root Cause:** Missing validation logic for input constraints in update endpoint

### DEF-008: Page Count not properly updated in response
- **Severity:** High
- **Frequency:** 5/5 runs (100%)
- **HTTP Method:** PUT
- **Endpoint:** `/books/{id}` (Update book)
- **Detailed Description:** When updating a book, the response does not reflect the updated data. The pages field consistently returns *Original* value regardless of the input value.
- **Steps to Reproduce:**
  1. Create a book with page count 10
  2. Send PUT request to update book with pages: 200
  3. Check the response book object pages field
- **Expected Result:** Response should contain the updated pages value - 200
- **Actual Result:** Response contains original pages number: 10 (or sometimes 12)
- **Root Cause:** Update operation not properly persisting data or returning cached/incorrect data

### DEF-009: Incorrect status code for non-existent book update
- **Severity:** Medium
- **Frequency:** 5/5 runs (100%)
- **HTTP Method:** PUT
- **Endpoint:** `/books/{id}` (Update book)
- **Detailed Description:** When attempting to update a non-existent book, the API returns 500 instead of 404.
- **Steps to Reproduce:**
  1. Send PUT request to `/books/99999` (non-existent ID)
  2. Check the response status code
- **Expected Result:** HTTP 404 (Not Found)
- **Actual Result:** HTTP 500 (Internal Server Error)
- **Root Cause:** Improper error handling for non-existent resource updates

### DEF-010: Inconsistent status codes for delete operations
- **Severity:** High
- **Frequency:** 3/5 runs (60%) for successful delete, 5/5 runs (100%) for error scenarios
- **HTTP Method:** DELETE
- **Endpoint:** `/books/{id}` (Delete book)
- **Detailed Description:** Delete operations show inconsistent behavior - successful deletion works in some runs (Runs 1, 2, 4) but fails in others (Runs 3, 5). All error scenarios consistently return 500 status code.
- **Steps to Reproduce:**
  1. Send DELETE request to delete existing book (intermittent 500 error)
  2. Send DELETE request to delete non-existent book
  3. Send DELETE request with negative ID
  4. Send DELETE request with zero ID
  5. Send DELETE request for already deleted book
- **Expected Result:** HTTP 200 for successful delete, HTTP 404 for non-existent, HTTP 400 for invalid ID
- **Actual Result:** HTTP 200 for successful delete (Runs 1, 2, 4), HTTP 500 for successful delete (Runs 3, 5), HTTP 500 for all error scenarios
- **Root Cause:** Intermittent backend error in delete operation implementation, possibly related to server state or timing issues

---


## 3.  Notes

- **Connection Issues:** Run 2 experienced a connection timeout error for one test case


