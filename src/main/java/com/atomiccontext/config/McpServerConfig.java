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
 * <p>Transport mode is selected via the active Spring profile:</p>
 * <ul>
 *   <li><strong>stdio</strong> (profile {@code stdio}) — for local clients such as
 *       Claude Desktop. All logging is silenced to keep the stdin/stdout pipe clean.
 *       Launch with: {@code --spring.profiles.active=stdio}</li>
 *   <li><strong>SSE/HTTP</strong> (profile {@code sse}, default) — exposes the MCP
 *       server over HTTP using Server-Sent Events on
 *       {@code /sse/atomic-context} (port 8080).
 *       Launch with: {@code --spring.profiles.active=sse}</li>
 * </ul>
 *
 * <p>No changes to {@code @Tool} methods are needed when switching profiles —
 * transport is fully controlled by {@code application-stdio.properties} and
 * {@code application-sse.properties}.</p>
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
