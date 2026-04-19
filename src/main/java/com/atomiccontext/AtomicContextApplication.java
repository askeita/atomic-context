package com.atomiccontext;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


/**
 * Entry point for the Atomic Context MCP server application.
 *
 * <p>This Spring Boot application exposes tools for querying fundamental
 * physical constants, particle properties, and material properties through
 * the Model Context Protocol (MCP).</p>
 */
@SpringBootApplication
public class AtomicContextApplication {

    /**
     * Main method that bootstraps the Spring Boot application.
     *
     * @param args command-line arguments passed to the application
     */
    public static void main(String[] args) {
        SpringApplication.run(AtomicContextApplication.class, args);
    }
}
