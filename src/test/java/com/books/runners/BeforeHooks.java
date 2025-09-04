package com.books.runners;

import com.books.context.TestContext;
import com.books.model.Book;
import com.books.services.CreateBookActions;
import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;
import io.cucumber.java.Before;

import java.io.InputStream;
import java.io.InputStreamReader;

public class BeforeHooks {

    CreateBookActions createActions = new CreateBookActions();
    private static final String TEST_DATA_FILE = "test-data/book-data.json";

    @Before("@before_createBook")
    public void createBookBeforeTest() {
        try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream(TEST_DATA_FILE)) {
            if (inputStream == null) {
                throw new RuntimeException("Test data file not found: " + TEST_DATA_FILE);
            }
            JsonReader reader = new JsonReader(new InputStreamReader(inputStream));
            Book book = new Gson().fromJson(reader, Book.class);

            createActions.setBookData(book);
            createActions.createBook();
            TestContext.getInstance().setBookId(createActions.getBookIdFromResponse());
        } catch (Exception e) {
            throw new RuntimeException("Failed to setup book for deletion test", e);
        }
    }
}
