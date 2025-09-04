package com.books.step_defs;

import com.books.services.SecurityActions;
import io.cucumber.java.en.When;

public class SecurityStepDefinitions {

    SecurityActions securityActions = new SecurityActions();

    @When("I make a request to get all books with invalid username")
    public void iMakeARequestToGetAllBooksWithInvalidUsername() {
        securityActions.getAllBooksWithInvalidUsername();
    }

    @When("I make a request to get all books with invalid password")
    public void iMakeARequestToGetAllBooksWithInvalidPassword() {
        securityActions.getAllBooksWithInvalidPassword();
    }

    @When("I make a request to get all books with empty credentials")
    public void iMakeARequestToGetAllBooksWithEmptyCredentials() {
        securityActions.getAllBooksWithEmptyCredentials();
    }

    @When("I make a request to get all books without authentication")
    public void iMakeARequestToGetAllBooksWithoutAuthentication() {
        securityActions.getAllBooksWithoutAuthentication();
    }
}
