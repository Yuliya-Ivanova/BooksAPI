package com.books.context;

public class TestContext {
    private static TestContext instance;
    private Integer bookId;

    private TestContext() {
    }

    public static TestContext getInstance() {
        if (instance == null) {
            instance = new TestContext();
        }
        return instance;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void clear() {
        bookId = null;
    }
}

