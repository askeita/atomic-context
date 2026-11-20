package com.atomiccontext.integration;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;

import java.nio.file.Path;
import java.util.UUID;

@SpringBootTest(
        webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT,
        properties = "server.shutdown=immediate")
@ActiveProfiles("sse")
public abstract class SeededApplicationIntegrationTest {

    private static final String DATABASE_URL = "jdbc:sqlite:"
            + Path.of(System.getProperty("java.io.tmpdir"),
                    "atomic-context-integration-" + UUID.randomUUID() + ".db");

    @DynamicPropertySource
    public static void configureDatabase(DynamicPropertyRegistry registry) {
        registry.add("spring.datasource.url", () -> DATABASE_URL);
    }
}
