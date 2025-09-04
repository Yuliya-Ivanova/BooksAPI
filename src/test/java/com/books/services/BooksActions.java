package com.books.services;

import org.junit.Assert;

import java.util.List;

public class BooksActions extends BaseService {

    protected static final String BOOKS_BASE_PATH = "/api/v1/books";

    public void getAllBooks() {
        executeGetRequest(BOOKS_BASE_PATH);
    }

    public void validateAllBooksResponse() {
        validateResponseIsJsonArray();
        validateBooksArrayStructure();
    }

    public void validateResponseIsJsonArray() {
        List<Object> booksList = response.jsonPath().getList("$");
        Assert.assertNotNull("Response should be a JSON array", booksList);
    }

    public void validateBooksArrayStructure() {
        List<Object> booksList = response.jsonPath().getList("$");
        for (int i = 0; i < booksList.size(); i++) {
            String bookPrefix = "[" + i + "]";

            validateResponseFieldNotNull(bookPrefix + ".id");
            validateResponseFieldNotNull(bookPrefix + ".name");
            validateResponseFieldNotNull(bookPrefix + ".author");
            validateResponseFieldNotNull(bookPrefix + ".publication");
            validateResponseFieldNotNull(bookPrefix + ".category");
            validateResponseFieldNotNull(bookPrefix + ".pages");
            validateResponseFieldNotNull(bookPrefix + ".price");

            validateFieldIsInteger(bookPrefix + ".id");
            validateFieldIsString(bookPrefix + ".name");
            validateFieldIsString(bookPrefix + ".author");
            validateFieldIsString(bookPrefix + ".publication");
            validateFieldIsString(bookPrefix + ".category");
            validateFieldIsInteger(bookPrefix + ".pages");
            validateFieldIsFloat(bookPrefix + ".price");
        }
    }


}
