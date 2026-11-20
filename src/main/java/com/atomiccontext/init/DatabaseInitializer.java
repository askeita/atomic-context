package com.atomiccontext.init;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Comparator;


/**
 * Runs SQL seed scripts from {@code classpath:db/seed/*.sql} in alphabetical
 * order on first startup.
 *
 * <p>Scripts are executed using an idempotent {@code INSERT OR IGNORE} pattern
 * so that repeated application restarts do not produce duplicate rows or
 * raise errors.</p>
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class DatabaseInitializer implements ApplicationRunner {

    /** JdbcTemplate used to execute raw SQL statements against the embedded database. */
    private final JdbcTemplate jdbcTemplate;

    /**
     * Discovers all {@code *.sql} files under {@code classpath:db/seed/},
     * sorts them alphabetically, and executes each statement sequentially.
     *
     * <p>Lines starting with {@code --} (SQL comments) and blank lines are
     * skipped. Seed statements use {@code INSERT OR IGNORE} for idempotence;
     * any other SQL error is allowed to fail startup.</p>
     *
     * @param args application arguments (not used)
     * @throws Exception if the resource resolver or I/O operations fail
     */
    @Override
    @Transactional
    public void run(ApplicationArguments args) throws Exception {
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        Resource[] scripts = resolver.getResources("classpath:db/seed/*.sql");
        Arrays.sort(scripts, Comparator.comparing(Resource::getFilename));
        for (Resource script : scripts) {
            log.info("Executing seed script: {}", script.getFilename());
            try (BufferedReader reader = new BufferedReader(
                    new InputStreamReader(script.getInputStream(), StandardCharsets.UTF_8))) {
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    String trimmed = line.trim();
                    if (trimmed.startsWith("--") || trimmed.isEmpty()) continue;
                    sb.append(line).append("\n");
                    if (trimmed.endsWith(";")) {
                        String sql = sb.toString().trim();
                        if (!sql.isEmpty()) {
                            jdbcTemplate.execute(sql.substring(0, sql.length() - 1));
                        }
                        sb.setLength(0);
                    }
                }
            }
        }
        log.info("Database seeding complete.");
    }
}
