package com.atomiccontext.integration;

import io.modelcontextprotocol.client.McpClient;
import io.modelcontextprotocol.client.McpSyncClient;
import io.modelcontextprotocol.client.transport.HttpClientSseClientTransport;
import io.modelcontextprotocol.json.McpJsonMapper;
import io.modelcontextprotocol.json.McpJsonMapperSupplier;
import io.modelcontextprotocol.spec.McpSchema;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;

import java.time.Duration;
import java.util.Map;
import java.util.ServiceLoader;

import static org.junit.jupiter.api.Assertions.assertTrue;

class McpSseIntegrationTest extends SeededApplicationIntegrationTest {

    @Value("${local.server.port}")
    private int port;

    @Test
    void initializesDiscoversToolsAndInvokesToolOverSse() {
        var transport = HttpClientSseClientTransport.builder("http://localhost:" + port)
                .sseEndpoint("/sse/atomic-context")
                .jsonMapper(jsonMapper())
                .build();
        try (McpSyncClient client = McpClient.sync(transport)
                .requestTimeout(Duration.ofSeconds(15))
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
