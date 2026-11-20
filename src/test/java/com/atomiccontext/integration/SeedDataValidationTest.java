package com.atomiccontext.integration;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import static org.junit.jupiter.api.Assertions.*;

class SeedDataValidationTest extends SeededApplicationIntegrationTest {

    private static final Pattern NUMBER = Pattern.compile(
            "[+-]?(?:\\d+(?:\\.\\d*)?|\\.\\d+)(?:[eE][+-]?\\d+)?");

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Test
    void everySeedRowHasSourceUnitAndParseableNumericValue() {
        List<Map<String, Object>> constants = jdbcTemplate.queryForList(
                "SELECT symbol AS row_name, source, unit, value_numeric AS value FROM physical_constants");
        assertTrue(constants.size() > 0, "physical_constants seed rows were not loaded");
        constants.forEach(row -> {
            assertPresent(row.get("source"), "physical_constants", row, "source");
            assertPresent(row.get("unit"), "physical_constants", row, "unit");
            assertNumeric(row.get("value"), "physical_constants", row, "value");
        });

        List<Map<String, Object>> particles = jdbcTemplate.queryForList(
                "SELECT name AS row_name, source, unit, "
                        + "COALESCE(mass_kg, mass_codata) AS value FROM particle_properties");
        assertTrue(particles.size() > 0, "particle_properties seed rows were not loaded");
        particles.forEach(row -> {
            assertPresent(row.get("source"), "particle_properties", row, "source");
            assertPresent(row.get("unit"), "particle_properties", row, "unit");
            assertNumeric(row.get("value"), "particle_properties", row, "value");
        });

        List<Map<String, Object>> materials = jdbcTemplate.queryForList(
                "SELECT name AS row_name, source_db AS source, unit, value_numeric AS value FROM materials");
        assertTrue(materials.size() > 0, "materials seed rows were not loaded");
        materials.forEach(row -> {
            assertPresent(row.get("source"), "materials", row, "source");
            assertPresent(row.get("unit"), "materials", row, "unit");
            assertNumeric(row.get("value"), "materials", row, "value");
        });

        List<Map<String, Object>> properties = jdbcTemplate.queryForList(
                "SELECT property_name AS row_name, source, unit, value FROM material_properties");
        assertTrue(properties.size() > 0, "material_properties seed rows were not loaded");
        properties.forEach(row -> {
            assertPresent(row.get("source"), "material_properties", row, "source");
            assertPresent(row.get("unit"), "material_properties", row, "unit");
            assertNumeric(row.get("value"), "material_properties", row, "value");
        });
    }

    private static void assertPresent(Object value, String table, Map<String, Object> row, String field) {
        assertNotNull(value, "%s row '%s' has no %s".formatted(table, row.get("row_name"), field));
        assertFalse(value.toString().isBlank(),
                "%s row '%s' has a blank %s".formatted(table, row.get("row_name"), field));
    }

    private static void assertNumeric(Object value, String table, Map<String, Object> row, String field) {
        String message = "%s row '%s' has no parseable %s: %s"
                .formatted(table, row.get("row_name"), field, value);
        assertNotNull(value, message);
        var matcher = NUMBER.matcher(value.toString());
        assertTrue(matcher.find(), message);
        assertDoesNotThrow(() -> Double.parseDouble(matcher.group()), message);
    }
}
