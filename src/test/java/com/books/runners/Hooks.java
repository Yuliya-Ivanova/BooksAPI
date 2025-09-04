package com.books.runners;

import io.cucumber.java.Before;
import io.restassured.RestAssured;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Hooks {
    @Before
    public void setUp() {
        RestAssured.baseURI = getBaseUrl();
    }

    private String getBaseUrl() {
        // Priority 1: System property
        String baseUrl = System.getProperty("restassured.baseURI");
        if (baseUrl != null && !baseUrl.trim().isEmpty()) {
            return baseUrl;
        }

        // Priority 2: Environment variable
        baseUrl = System.getenv("BASE_URL");
        if (baseUrl != null && !baseUrl.trim().isEmpty()) {
            return baseUrl;
        }

        // Priority 3: Properties file
        try {
            Properties props = new Properties();
            InputStream input = getClass().getClassLoader().getResourceAsStream("config.properties");
            if (input != null) {
                props.load(input);
                baseUrl = props.getProperty("api.base.url");
                if (baseUrl != null && !baseUrl.trim().isEmpty()) {
                    return baseUrl;
                }
            }
        } catch (IOException e) {
            System.out.println("Warning: Could not load config.properties file: " + e.getMessage());
        }

        throw new RuntimeException("Base URL not found");
    }
} 