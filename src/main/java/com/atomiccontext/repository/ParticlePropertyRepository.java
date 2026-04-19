package com.atomiccontext.repository;

import com.atomiccontext.entity.ParticleProperty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;


/**
 * Spring Data JPA repository for {@link ParticleProperty} entities.
 *
 * <p>Provides exact-match lookups by name and particle type as well as a
 * JPQL keyword search across name, symbol, and particle-type fields.</p>
 */
public interface ParticlePropertyRepository extends JpaRepository<ParticleProperty, Long> {

    /**
     * Looks up a particle by its common name (case-insensitive exact match).
     *
     * @param name particle name, e.g. {@code "electron"}, {@code "muon"}
     * @return an {@link Optional} containing the matching particle, or empty
     */
    Optional<ParticleProperty> findByNameIgnoreCase(String name);

    /**
     * Full-text search across name, symbol, and particle-type fields using a
     * case-insensitive LIKE pattern.
     *
     * @param query keyword to search for
     * @return list of matching {@link ParticleProperty} records
     */
    @Query("SELECT p FROM ParticleProperty p WHERE " +
           "LOWER(p.name) LIKE LOWER(CONCAT('%', :q, '%')) OR " +
           "LOWER(p.symbol) LIKE LOWER(CONCAT('%', :q, '%')) OR " +
           "LOWER(p.particleType) LIKE LOWER(CONCAT('%', :q, '%'))")
    List<ParticleProperty> search(@Param("q") String query);

    /**
     * Returns all particles belonging to the given type
     * (case-insensitive exact match).
     *
     * @param particleType particle classification, e.g. {@code "lepton"}, {@code "quark"}
     * @return list of matching {@link ParticleProperty} records
     */
    List<ParticleProperty> findByParticleTypeIgnoreCase(String particleType);
}
