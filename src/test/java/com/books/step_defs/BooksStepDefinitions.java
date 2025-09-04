package com.books.step_defs;

import com.books.services.BooksActions;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class BooksStepDefinitions {

    BooksActions booksAPIActions = new BooksActions();

    @When("Get All Books")
    public void getAllBooks() {
        booksAPIActions.getAllBooks();
    }

    @Then("Validate status code is {}")
    public void validateStatusCode(int code) {
        booksAPIActions.validateResponse(code);
    }

    @Then("Validate all books response structure")
    public void validateAllBooksResponseStructure() {
        booksAPIActions.validateAllBooksResponse();
    }

} 