package com.books.runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/test/resources/features",
        glue = {"com/books/step_defs", "com/books/runners"},
        plugin = {
                "html:target/cucumber-reports.html",
                "json:target/cucumber.json",
                "pretty"
        },
        dryRun = false,
        monochrome = true,
        publish = false
)
public class TestRunner {
} 