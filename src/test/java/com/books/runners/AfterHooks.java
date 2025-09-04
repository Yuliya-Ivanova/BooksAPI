package com.books.runners;

import com.books.context.TestContext;
import com.books.services.DeleteBookActions;
import io.cucumber.java.After;

public class AfterHooks {

    DeleteBookActions deleteActions = new DeleteBookActions();

    @After("@after_deleteBook")
    public void deleteCreatedBookAfterTest() {
        deleteActions.deleteBookById(TestContext.getInstance().getBookId());
    }
}
