package com.books.step_defs;

import com.books.context.TestContext;
import com.books.services.GetBookByIdActions;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class GetBookByIdStepDefinitions {

    GetBookByIdActions actions = new GetBookByIdActions();

    @When("I get a book by ID {string}")
    public void getBookByIdString(String id) {
        actions.getBookById(id);
    }

    @Then("the response should contain a single book object")
    public void validateSingleBookObject() {
        actions.validateResponseIsJsonObject();
    }

    @Then("the book should have all required fields")
    public void validateBookHasAllRequiredFields() {
        actions.validateSingleBookStructure();
    }

    @Then("all book fields should have correct data types")
    public void validateBookFieldDataTypes() {
        actions.validateSingleBookStructure();
    }

    @When("I get just created book by ID")
    @And("I get just deleted book by ID")
    public void getCreatedBookById() {
        actions.getBookById(TestContext.getInstance().getBookId());
    }

}
