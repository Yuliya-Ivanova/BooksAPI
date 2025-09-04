package com.books.services;

public class DeleteBookActions extends BaseService {

    protected static final String DELETE_BOOK_PATH = "/api/v1/books";

    public void deleteBookById(Integer bookId) {
        executeDeleteRequest(DELETE_BOOK_PATH, bookId);
    }

    public void deleteBookById(String bookId) {
        executeDeleteRequest(DELETE_BOOK_PATH, bookId);
    }
}
