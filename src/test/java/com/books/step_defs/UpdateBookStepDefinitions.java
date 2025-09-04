package com.books.step_defs;

import com.books.model.Book;
import com.books.services.UpdateBookActions;
import com.books.utils.Utils;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.util.Map;

public class UpdateBookStepDefinitions {

    UpdateBookActions actions = new UpdateBookActions();
    private Book bookData;

    @Given("I have valid book data for update:")
    public void iHaveValidBookDataForUpdate(DataTable dataTable) {
        bookData = Utils.createBookFromDataTable(dataTable);
        actions.setUpdatedBookData(bookData);
    }

    @Given("I have invalid book data for update:")
    public void iHaveInvalidBookDataForUpdate(DataTable dataTable) {
        Map<String, Object> bookDataMap = dataTable.asMap(String.class, Object.class);
        actions.setInvalidBookData(bookDataMap);
    }

    @Given("I have an empty book data for update")
    public void iHaveEmptyBookDataForUpdate() {
        actions.setUpdatedBookData(null);
    }

    @When("I update the book")
    public void iUpdateTheBook() {
        if (bookData == null && actions.updatedBookData == null) {
            actions.updateBookWithEmptyBody();
        } else {
            actions.updateBook();
        }
    }

    @When("I update the book with invalid data")
    public void iUpdateTheBookWithInvalidData() {
        actions.updateBookWithInvalidData();
    }

    @When("I update the book with malformed data")
    public void iUpdateTheBookWithMalformedData() {
        actions.updateBookWithMalformedJson();
    }

    @When("I update book with id {string}")
    public void iUpdateBook(String id) {
        actions.updateBookById(id);
    }

    @Then("the response should contain the updated book object")
    public void validateResponseContainsUpdatedBookObject() {
        actions.validateUpdatedBookDataMatchesInput();
    }

    @Then("the book ID should remain unchanged")
    public void validateBookIdRemainsUnchanged() {
        actions.validateBookIdRemainsUnchanged();
    }
}
