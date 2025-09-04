package com.books.services;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.junit.Assert;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class BaseService {

    public static Response response;
    protected static Properties config;
    protected static String baseUrl;
    protected static String username;
    protected static String password;

    static {
        loadConfig();
    }

    private static void loadConfig() {
        config = new Properties();
        try (InputStream input = BaseService.class.getClassLoader().getResourceAsStream("config.properties")) {
            if (input == null) {
                throw new RuntimeException("Unable to find config.properties file");
            }
            config.load(input);
            baseUrl = config.getProperty("api.base.url");
            username = config.getProperty("api.username");
            password = config.getProperty("api.password");
        } catch (IOException e) {
            throw new RuntimeException("Error loading config.properties", e);
        }
    }

    protected RequestSpecification createBaseRequest(String username, String password) {
        return RestAssured.given()
                .baseUri(baseUrl)
                .accept(ContentType.JSON)
                .auth().basic(username, password);
    }

    protected RequestSpecification createBaseRequestNoAuth() {
        return RestAssured.given()
                .baseUri(baseUrl)
                .accept(ContentType.JSON);
    }

    protected RequestSpecification createJsonRequest() {
        return createBaseRequest(username, password)
                .contentType(ContentType.JSON);
    }

    protected void executeGetRequest(String endpoint) {
        response = createBaseRequest(username, password)
                .when().log().all()
                .get(endpoint)
                .prettyPeek();
    }

    protected void executeGetRequest(String endpoint, Object id) {
        response = createBaseRequest(username, password)
                .when().log().all()
                .get(endpoint + "/" + id)
                .prettyPeek();
    }

    protected void executePostRequest(String endpoint, Object body) {
        response = createJsonRequest()
                .body(body)
                .when().log().all()
                .post(endpoint)
                .prettyPeek();
    }

    protected void executePutRequest(String endpoint, Object body, Object id) {
        response = createJsonRequest()
                .body(body)
                .when().log().all()
                .put(endpoint + "/" + id)
                .prettyPeek();
    }

    protected void executeDeleteRequest(String endpoint, Object id) {
        response = createBaseRequest(username, password)
                .when().log().all()
                .delete(endpoint + "/" + id)
                .prettyPeek();
    }

    public void validateResponse(int expectedStatusCode) {
        if (response == null) {
            throw new RuntimeException("Response is null - no API call was made");
        }

        int actualStatusCode = response.statusCode();
        Assert.assertEquals("Status code validation failed", expectedStatusCode, actualStatusCode);
    }

    protected void validateResponseFieldNotNull(String fieldName) {
        Object value = response.path(fieldName);
        Assert.assertNotNull("Field should not be null: " + fieldName, value);
    }

    protected void validateFieldIsInteger(String fieldPath) {
        Object value = response.path(fieldPath);
        Assert.assertTrue("Field " + fieldPath + " should be an integer, but was: " + value.getClass().getSimpleName(),
                value instanceof Integer);
    }

    protected void validateFieldIsFloat(String fieldPath) {
        Object value = response.path(fieldPath);
        Assert.assertTrue("Field " + fieldPath + " should be an float, but was: " + value.getClass().getSimpleName(),
                value instanceof Float);
    }

    protected void validateFieldIsString(String fieldPath) {
        Object value = response.path(fieldPath);
        Assert.assertTrue("Field " + fieldPath + " should be a string, but was: " + value.getClass().getSimpleName(),
                value instanceof String);
    }

    public void validateResponseIsJsonObject() {
        Object bookObject = response.jsonPath().get("$");
        Assert.assertNotNull("Response should be a JSON object", bookObject);
        Assert.assertFalse("Response should not be an array", bookObject instanceof java.util.List);
    }
} 