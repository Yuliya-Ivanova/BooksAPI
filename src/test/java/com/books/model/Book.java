package com.books.model;

import com.google.gson.annotations.SerializedName;
import groovyjarjarantlr4.v4.runtime.misc.NotNull;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class Book {

    @SerializedName("id")
    private Integer id;

    @NotNull
    @SerializedName("name")
    private String name;

    @NotNull
    @SerializedName("author")
    private String author;

    @NotNull
    @SerializedName("publication")
    private String publication;

    @NotNull
    @SerializedName("category")
    private String category;

    @NotNull
    @SerializedName("pages")
    private Integer pages;

    @NotNull
    @SerializedName("price")
    private Float price;

} 