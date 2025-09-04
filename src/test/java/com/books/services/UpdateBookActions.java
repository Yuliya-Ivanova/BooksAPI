package com.books.services;

import com.books.context.TestContext;
import com.books.model.Book;
import com.books.utils.Utils;
import org.junit.Assert;

import java.util.Map;

public class UpdateBookActions extends BaseService {

    protected static final String UPDATE_BOOK_PATH = "/api/v1/books";
    public Book updatedBookData;
    public Map<String, Object> invalidBookData;

    public void setUpdatedBookData(Book book) {
        this.updatedBookData = book;
    }

    public void setInvalidBookData(Map<String, Object> data) {
        this.invalidBookData = data;
    }

    public void updateBook() {
        executePutRequest(UPDATE_BOOK_PATH, updatedBookData, TestContext.getInstance().getBookId());
    }

    public void updateBookWithInvalidData() {
        executePutRequest(UPDATE_BOOK_PATH, invalidBookData, TestContext.getInstance().getBookId());
    }

    public void updateBookWithEmptyBody() {
        executePutRequest(UPDATE_BOOK_PATH, "", TestContext.getInstance().getBookId());
    }

    public void updateBookWithMalformedJson() {
        String malformedJson = "{ \"name\": \"Updated Book\", \"author\": \"Updated Author\", \"publication\": \"Updated Pub\", \"category\": \"Updated Cat\", \"pages\": \"invalid\", \"price\": }";
        executePutRequest(UPDATE_BOOK_PATH, malformedJson, TestContext.getInstance().getBookId());
    }

    public void updateBookById(String id) {
        executePutRequest(UPDATE_BOOK_PATH, updatedBookData, id);
    }

    public void validateUpdatedBookDataMatchesInput() {
        Utils.validateBookDataMatchesInput(response, updatedBookData);
    }

    public void validateBookIdRemainsUnchanged() {
        Integer responseId = response.jsonPath().get("id");
        Assert.assertEquals("Book ID should remain unchanged", TestContext.getInstance().getBookId(), responseId);
    }
}
