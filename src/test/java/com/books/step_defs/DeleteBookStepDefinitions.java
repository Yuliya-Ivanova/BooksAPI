package com.books.step_defs;

import com.books.context.TestContext;
import com.books.services.DeleteBookActions;
import io.cucumber.java.en.When;

public class DeleteBookStepDefinitions {

    DeleteBookActions deleteActions = new DeleteBookActions();

    @When("I delete the book by ID")
    public void iDeleteTheBookById() {
        deleteActions.deleteBookById(TestContext.getInstance().getBookId());
    }

    @When("I delete the book by ID {string}")
    public void iDeleteTheBookById(String id) {
        deleteActions.deleteBookById(id);
    }

    @When("I delete the book by ID with spaces before and after id")
    public void iDeleteTheBookByIdWithSpaces() {
        deleteActions.deleteBookById("   " + TestContext.getInstance().getBookId() + "   ");
    }
}
