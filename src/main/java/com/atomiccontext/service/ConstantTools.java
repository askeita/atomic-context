package com.atomiccontext.service;

import com.atomiccontext.entity.PhysicalConstant;
import com.atomiccontext.repository.PhysicalConstantRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.ai.tool.annotation.ToolParam;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;


/**
 * MCP tool service that exposes fundamental physical constants to AI clients.
 *
 * <p>Constants are sourced from the NIST CODATA database. Three tools are
 * provided:</p>
 * <ul>
 *   <li>{@code get_constant} — exact lookup by symbol or name</li>
 *   <li>{@code search_constants} — keyword-based discovery</li>
 *   <li>{@code list_constant_categories} — enumeration of available categories</li>
 * </ul>
 */
@Service
@RequiredArgsConstructor
public class ConstantTools {

    /** Repository used to query {@link PhysicalConstant} records. */
    private final PhysicalConstantRepository repository;

    /**
     * Returns the exact CODATA value for a fundamental physical constant
     * identified by its symbol or full name.
     *
     * <p>The lookup is performed in the following order:</p>
     * <ol>
     *   <li>Exact symbol match (case-insensitive)</li>
     *   <li>Exact name match (case-insensitive)</li>
     *   <li>Fuzzy / keyword search as fallback</li>
     * </ol>
     *
     * @param symbolOrName symbol (e.g. {@code "h"}, {@code "c"}) or full name
     *                     (e.g. {@code "Planck constant"}) of the constant
     * @return a formatted string containing value, unit, uncertainty, category,
     *         CODATA year, and citable source; or an informative not-found message
     */
    @Tool(name = "get_constant",
          description = """
          Returns the exact CODATA value (inline notation with full uncertainty) for a fundamental
          physical constant. Query by symbol (e.g. "c", "h", "e", "G", "k_B", "N_A", "alpha")
          or full name (e.g. "speed of light", "Planck constant", "elementary charge").
          Returns value, unit, uncertainty, category, CODATA year, and citable source/DOI.
          """)
    public String getConstant(
            @ToolParam(description = "Symbol (e.g. 'h', 'c', 'e') or name (e.g. 'Planck constant') of the constant")
            String symbolOrName) {
        Optional<PhysicalConstant> result = repository.findBySymbolIgnoreCase(symbolOrName);
        if (result.isEmpty()) {
            result = repository.findByNameIgnoreCase(symbolOrName);
        }
        if (result.isEmpty()) {
            List<PhysicalConstant> fuzzy = repository.search(symbolOrName);
            if (!fuzzy.isEmpty()) {
                return formatConstant(fuzzy.get(0)) +
                       "\n\n[Fuzzy match — other candidates: " +
                       fuzzy.stream().skip(1).limit(4)
                            .map(c -> c.getSymbol() + " (" + c.getName() + ")")
                            .collect(Collectors.joining(", ")) + "]";
            }
            return "No constant found matching '" + symbolOrName + "'. " +
                   "Use search_constants to explore available constants.";
        }
        return formatConstant(result.get());
    }

    /**
     * Searches fundamental physical constants by keyword and returns a
     * summary list.
     *
     * @param query keyword to search — name, symbol, or category
     *              (e.g. {@code "magnetic"}, {@code "electron"}, {@code "universal"})
     * @return a newline-separated summary of matching constants, or a
     *         not-found message
     */
    @Tool(name = "search_constants",
          description = """
          Searches fundamental physical constants by keyword. Returns a list of matching constants
          with their CODATA values and units.
          Useful for discovering available constants or finding constants by category
          (e.g. "electromagnetic", "atomic", "universal", "physico-chemical").
          """)
    public String searchConstants(
            @ToolParam(description = "Keyword to search: name, symbol, or category (e.g. 'magnetic', 'electron', 'universal')")
            String query) {
        List<PhysicalConstant> results = repository.search(query);
        if (results.isEmpty()) {
            return "No constants found matching '" + query + "'.";
        }
        return results.stream()
                      .map(this::formatConstantSummary)
                      .collect(Collectors.joining("\n"));
    }

    /**
     * Lists all distinct categories of physical constants available in the
     * database.
     *
     * @return a newline-separated, sorted list of category names
     */
    @Tool(name = "list_constant_categories",
          description = "Lists all available categories of physical constants: universal, electromagnetic, atomic, physico-chemical.")
    public String listConstantCategories() {
        return repository.findAll().stream()
                .map(PhysicalConstant::getCategory)
                .distinct()
                .sorted()
                .collect(Collectors.joining("\n"));
    }

    // ---- Formatting helpers ----

    /**
     * Formats a {@link PhysicalConstant} into a multi-line detail block.
     *
     * @param c the constant to format
     * @return formatted string with all constant fields
     */
    private String formatConstant(PhysicalConstant c) {
        return """
               Constant : %s (%s)
               Value    : %s %s
               Uncertainty: %s
               Category : %s
               CODATA   : %d
               Source   : %s
               """.formatted(
                c.getName(), c.getSymbol(),
                c.getValueCodata(), c.getUnit() != null ? c.getUnit() : "",
                c.getUncertainty() != null ? c.getUncertainty() : "N/A",
                c.getCategory(),
                c.getCodataYear(),
                c.getSource()
        );
    }

    /**
     * Formats a {@link PhysicalConstant} into a concise single-line summary.
     *
     * @param c the constant to format
     * @return one-line bullet summary
     */
    private String formatConstantSummary(PhysicalConstant c) {
        return "• %s (%s): %s %s  [%s]".formatted(
                c.getName(), c.getSymbol(),
                c.getValueCodata(),
                c.getUnit() != null ? c.getUnit() : "",
                c.getCategory()
        );
    }
}
