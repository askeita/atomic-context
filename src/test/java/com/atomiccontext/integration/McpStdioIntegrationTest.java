package com.atomiccontext.integration;

import io.modelcontextprotocol.client.McpClient;
import io.modelcontextprotocol.client.McpSyncClient;
import io.modelcontextprotocol.client.transport.ServerParameters;
import io.modelcontextprotocol.client.transport.StdioClientTransport;
import io.modelcontextprotocol.json.McpJsonMapper;
import io.modelcontextprotocol.json.McpJsonMapperSupplier;
import io.modelcontextprotocol.spec.McpSchema;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import java.nio.file.Path;
import java.time.Duration;
import java.util.Map;
import java.util.ServiceLoader;

import static org.junit.jupiter.api.Assertions.assertTrue;

class McpStdioIntegrationTest {

    @TempDir
    Path tempDir;

    @Test
    void initializesDiscoversToolsAndInvokesToolOverStdio() {
        String classpath = System.getProperty("surefire.test.class.path",
                System.getProperty("java.class.path"));
        String databaseUrl = "jdbc:sqlite:" + tempDir.resolve("stdio.db");
        ServerParameters parameters = ServerParameters.builder("java")
                .args("-cp", classpath,
                        "com.atomiccontext.AtomicContextApplication",
                        "--spring.profiles.active=stdio",
                        "--spring.datasource.url=" + databaseUrl)
                .build();
        var transport = new StdioClientTransport(parameters, jsonMapper());
        try (McpSyncClient client = McpClient.sync(transport)
                .requestTimeout(Duration.ofSeconds(30))
                .build()) {
            client.initialize();
            var tools = client.listTools().tools();

            assertTrue(tools.stream().map(McpSchema.Tool::name).anyMatch("get_constant"::equals));

            var result = client.callTool(new McpSchema.CallToolRequest(
                    "get_constant", Map.of("symbolOrName", "h")));
            assertTrue(result.content().stream()
                    .filter(McpSchema.TextContent.class::isInstance)
                    .map(McpSchema.TextContent.class::cast)
                    .anyMatch(content -> content.text().contains("Planck constant")));
        }
    }

    private static McpJsonMapper jsonMapper() {
        return ServiceLoader.load(McpJsonMapperSupplier.class)
                .findFirst()
                .orElseThrow(() -> new IllegalStateException("No MCP JSON mapper is available"))
                .get();
    }
}
