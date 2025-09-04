package com.books.utils;

import com.books.model.Book;
import io.cucumber.datatable.DataTable;
import io.restassured.response.Response;
import org.junit.Assert;

import java.util.Map;

public class Utils {
    public static void validateBookDataMatchesInput(Response response, Book bookData) {
        String responseName = response.jsonPath().get("name");
        String responseAuthor = response.jsonPath().get("author");
        String responsePublication = response.jsonPath().get("publication");
        String responseCategory = response.jsonPath().get("category");
        Integer responsePages = response.jsonPath().get("pages");
        Float responsePrice = response.jsonPath().getFloat("price");

        Assert.assertEquals("Book name should match input", bookData.getName(), responseName);
        Assert.assertEquals("Book author should match input", bookData.getAuthor(), responseAuthor);
        Assert.assertEquals("Book publication should match input", bookData.getPublication(), responsePublication);
        Assert.assertEquals("Book category should match input", bookData.getCategory(), responseCategory);
        Assert.assertEquals("Book pages should match input", bookData.getPages(), responsePages);
        Assert.assertEquals("Book price should match input", bookData.getPrice(), responsePrice);
    }

    public static Book createBookFromDataTable(DataTable dataTable) {
        Map<String, String> bookDataMap = dataTable.asMap(String.class, String.class);
        Book book = new Book();
        book.setName(bookDataMap.get("name"));
        book.setAuthor(bookDataMap.get("author"));
        book.setPublication(bookDataMap.get("publication"));
        book.setCategory(bookDataMap.get("category"));
        book.setPages(Integer.parseInt(bookDataMap.get("pages")));
        book.setPrice(Float.parseFloat(bookDataMap.get("price")));
        return book;
    }
}
