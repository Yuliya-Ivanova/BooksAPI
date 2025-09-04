package com.books.services;

import com.books.model.Book;

public class GetBookByIdActions extends BaseService {

    protected static final String BOOKS_BY_ID_PATH = "/api/v1/books";

    public void getBookById(Object bookId) {
        executeGetRequest(BOOKS_BY_ID_PATH, bookId);
        deserializeResponseToBook();
    }

    private void deserializeResponseToBook() {
        if (response != null && response.getStatusCode() == 200) {
            response.as(Book.class);
        }
    }

    public void validateSingleBookStructure() {
        validateResponseFieldNotNull("id");
        validateResponseFieldNotNull("name");
        validateResponseFieldNotNull("author");
        validateResponseFieldNotNull("publication");
        validateResponseFieldNotNull("category");
        validateResponseFieldNotNull("pages");
        validateResponseFieldNotNull("price");

        validateFieldIsInteger("id");
        validateFieldIsString("name");
        validateFieldIsString("author");
        validateFieldIsString("publication");
        validateFieldIsString("category");
        validateFieldIsInteger("pages");
        validateFieldIsFloat("price");
    }


}
