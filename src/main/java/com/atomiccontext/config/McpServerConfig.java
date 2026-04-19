package com.atomiccontext.config;

import com.atomiccontext.service.ConstantTools;
import com.atomiccontext.service.MaterialTools;
import com.atomiccontext.service.ParticleTools;
import org.springframework.ai.tool.ToolCallbackProvider;
import org.springframework.ai.tool.method.MethodToolCallbackProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


/**
 * Spring configuration class for the MCP server.
 *
 * <p>Registers all physics-domain tool beans ({@link ConstantTools},
 * {@link ParticleTools}, {@link MaterialTools}) with the Spring AI MCP
 * server so that they are discoverable by connected AI clients.</p>
 *
 * <p>Transport is automatically configured as {@code stdio} by the
 * {@code spring-ai-mcp-server-spring-boot-starter} (see
 * {@code application.properties}).</p>
 *
 * <p><strong>Phase 2 (SSE/HTTP):</strong> add
 * {@code spring-ai-mcp-server-webmvc-spring-boot-starter} to
 * {@code pom.xml} and set
 * {@code spring.ai.mcp.server.transport=sse} — no tool changes needed.</p>
 */
@Configuration
public class McpServerConfig {

    /**
     * Registers all MCP tool objects with the Spring AI
     * {@link ToolCallbackProvider} so they are exposed via the MCP protocol.
     *
     * @param constantTools  tool service for fundamental physical constants
     * @param particleTools  tool service for particle properties
     * @param materialTools  tool service for material properties
     * @return a {@link ToolCallbackProvider} that wraps all tool objects
     */
    @Bean
    public ToolCallbackProvider physicsToolCallbacks(
            ConstantTools constantTools,
            ParticleTools particleTools,
            MaterialTools materialTools) {
        return MethodToolCallbackProvider.builder()
                .toolObjects(constantTools, particleTools, materialTools)
                .build();
    }
}
