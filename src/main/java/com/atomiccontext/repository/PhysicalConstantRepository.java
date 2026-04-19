package com.atomiccontext.repository;

import com.atomiccontext.entity.PhysicalConstant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;


/**
 * Spring Data JPA repository for {@link PhysicalConstant} entities.
 *
 * <p>Provides exact-match lookups by symbol and name, a multi-field keyword
 * search, and a category filter — all backed by JPQL or derived query
 * methods.</p>
 */
public interface PhysicalConstantRepository extends JpaRepository<PhysicalConstant, Long> {

    /**
     * Looks up a constant by its CODATA symbol (case-insensitive exact match).
     *
     * @param symbol the symbol to look up, e.g. {@code "c"}, {@code "h"}
     * @return an {@link Optional} containing the matching constant, or empty
     */
    Optional<PhysicalConstant> findBySymbolIgnoreCase(String symbol);

    /**
     * Looks up a constant by its full name (case-insensitive exact match).
     *
     * @param name the full name, e.g. {@code "speed of light in vacuum"}
     * @return an {@link Optional} containing the matching constant, or empty
     */
    Optional<PhysicalConstant> findByNameIgnoreCase(String name);

    /**
     * Full-text search across name, symbol, and category fields using a
     * case-insensitive LIKE pattern.
     *
     * @param query keyword to search for
     * @return list of matching {@link PhysicalConstant} records
     */
    @Query("SELECT c FROM PhysicalConstant c WHERE " +
           "LOWER(c.name) LIKE LOWER(CONCAT('%', :q, '%')) OR " +
           "LOWER(c.symbol) LIKE LOWER(CONCAT('%', :q, '%')) OR " +
           "LOWER(c.category) LIKE LOWER(CONCAT('%', :q, '%'))")
    List<PhysicalConstant> search(@Param("q") String query);

    /**
     * Returns all constants belonging to the given thematic category
     * (case-insensitive exact match).
     *
     * @param category one of {@code universal}, {@code electromagnetic},
     *                 {@code atomic}, {@code physico-chemical}
     * @return list of matching {@link PhysicalConstant} records
     */
    List<PhysicalConstant> findByCategoryIgnoreCase(String category);
}
