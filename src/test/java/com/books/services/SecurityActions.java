package com.books.services;

public class SecurityActions extends BaseService {

    public void getAllBooksWithInvalidUsername() {
        getAllBooks("invalid_user", password);
    }

    public void getAllBooksWithInvalidPassword() {
        getAllBooks("username", "invalid_password");
    }

    public void getAllBooksWithEmptyCredentials() {
        getAllBooks("", "");
    }

    private void getAllBooks(String username, String password) {
        response = createBaseRequest(username, password)
                .when().log().all()
                .get("/books")
                .prettyPeek();
    }

    public void getAllBooksWithoutAuthentication() {
        response = createBaseRequestNoAuth()
                .when().log().all()
                .get("/books")
                .prettyPeek();
    }
}
