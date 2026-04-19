package com.atomiccontext.repository;

import com.atomiccontext.entity.Material;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


/**
 * Spring Data JPA repository for {@link Material} entities.
 *
 * <p>Provides derived query methods for category-based lookups as well as
 * custom JPQL full-text search queries across name, composition, and
 * sub-category fields.</p>
 */
public interface MaterialRepository extends JpaRepository<Material, Long> {

    /**
     * Returns all materials belonging to the given category
     * (case-insensitive exact match).
     *
     * @param category top-level category string, e.g. {@code "metal"}, {@code "ceramic"}
     * @return list of matching {@link Material} records
     */
    List<Material> findByCategoryIgnoreCase(String category);

    /**
     * Full-text search across name, composition, and sub-category fields
     * using a case-insensitive LIKE pattern.
     *
     * @param query keyword to search for
     * @return list of matching {@link Material} records
     */
    @Query("SELECT m FROM Material m WHERE " +
           "LOWER(m.name) LIKE LOWER(CONCAT('%', :q, '%')) OR " +
           "LOWER(m.composition) LIKE LOWER(CONCAT('%', :q, '%')) OR " +
           "LOWER(m.subCategory) LIKE LOWER(CONCAT('%', :q, '%'))")
    List<Material> search(@Param("q") String query);

    /**
     * Full-text search limited to a specific top-level category, matching
     * against name and composition fields.
     *
     * @param query    keyword to search for
     * @param category top-level category filter, e.g. {@code "semiconductor"}
     * @return list of matching {@link Material} records within the given category
     */
    @Query("SELECT m FROM Material m WHERE " +
           "LOWER(m.category) = LOWER(:category) AND " +
           "(LOWER(m.name) LIKE LOWER(CONCAT('%', :q, '%')) OR " +
           "LOWER(m.composition) LIKE LOWER(CONCAT('%', :q, '%')))")
    List<Material> searchByCategory(@Param("q") String query, @Param("category") String category);
}
