package com.atomiccontext.repository;

import com.atomiccontext.entity.MaterialProperty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


/**
 * Spring Data JPA repository for {@link MaterialProperty} entities.
 *
 * <p>Provides custom JPQL queries for retrieving material properties by
 * property name, category, and measurement temperature, as well as
 * discovery queries for listing distinct names and categories.</p>
 */
public interface MaterialPropertyRepository extends JpaRepository<MaterialProperty, Long> {

    /**
     * Returns all properties of a given material whose name contains the
     * specified keyword (case-insensitive).
     *
     * @param materialId   the ID of the parent {@link com.atomiccontext.entity.Material}
     * @param propertyName keyword to match against the property name
     * @return matching {@link MaterialProperty} records
     */
    @Query("SELECT mp FROM MaterialProperty mp WHERE mp.material.id = :materialId " +
           "AND LOWER(mp.propertyName) LIKE LOWER(CONCAT('%', :propertyName, '%'))")
    List<MaterialProperty> findByMaterialIdAndPropertyName(
            @Param("materialId") Long materialId,
            @Param("propertyName") String propertyName);

    /**
     * Returns all properties of a given material that belong to the specified
     * category (case-insensitive exact match).
     *
     * @param materialId the ID of the parent material
     * @param category   property category, e.g. {@code "mechanical"}, {@code "thermal"}
     * @return matching {@link MaterialProperty} records
     */
    @Query("SELECT mp FROM MaterialProperty mp WHERE mp.material.id = :materialId " +
           "AND LOWER(mp.propertyCategory) = LOWER(:category)")
    List<MaterialProperty> findByMaterialIdAndCategory(
            @Param("materialId") Long materialId,
            @Param("category") String category);

    /**
     * Returns properties whose measurement temperature is within {@code tolerance}
     * Kelvin of the requested temperature, filtered by property name keyword.
     *
     * <p>If {@code temperatureK} is {@code null} in the database, 298.15 K
     * is assumed as the reference value.</p>
     *
     * @param materialId   the ID of the parent material
     * @param propertyName keyword to match against the property name
     * @param tempK        target temperature in Kelvin
     * @param tolerance    maximum allowed deviation in Kelvin
     * @return matching {@link MaterialProperty} records sorted by closeness
     */
    @Query("SELECT mp FROM MaterialProperty mp WHERE mp.material.id = :materialId " +
           "AND LOWER(mp.propertyName) LIKE LOWER(CONCAT('%', :propertyName, '%')) " +
           "AND ABS(COALESCE(mp.temperatureK, 298.15) - :tempK) < :tolerance")
    List<MaterialProperty> findByMaterialIdAndPropertyNameNearTemperature(
            @Param("materialId") Long materialId,
            @Param("propertyName") String propertyName,
            @Param("tempK") Double tempK,
            @Param("tolerance") Double tolerance);

    /**
     * Returns the distinct property names available for a given material,
     * sorted alphabetically.
     *
     * @param materialId the ID of the parent material
     * @return sorted list of unique property name strings
     */
    @Query("SELECT DISTINCT mp.propertyName FROM MaterialProperty mp WHERE mp.material.id = :materialId ORDER BY mp.propertyName")
    List<String> findDistinctPropertyNamesByMaterialId(@Param("materialId") Long materialId);

    /**
     * Returns the distinct property categories available for a given material,
     * sorted alphabetically.
     *
     * @param materialId the ID of the parent material
     * @return sorted list of unique category strings
     */
    @Query("SELECT DISTINCT mp.propertyCategory FROM MaterialProperty mp WHERE mp.material.id = :materialId ORDER BY mp.propertyCategory")
    List<String> findDistinctPropertyCategoriesByMaterialId(@Param("materialId") Long materialId);
}
