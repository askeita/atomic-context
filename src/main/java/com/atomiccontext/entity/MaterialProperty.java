package com.atomiccontext.entity;

import jakarta.persistence.*;
import lombok.Data;


/**
 * JPA entity representing a single measured or computed property of a
 * {@link Material}.
 *
 * <p>Each row captures one scalar value (e.g. tensile strength, bandgap,
 * thermal conductivity) together with its unit, uncertainty, measurement
 * temperature, experimental condition, and citable source.</p>
 */
@Data
@Entity
@Table(name = "material_properties")
public class MaterialProperty {

    /** Auto-generated primary key. */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /** The parent material this property belongs to. */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "material_id", nullable = false)
    private Material material;

    /**
     * Normalized property name.
     *
     * <p>Examples by category:</p>
     * <ul>
     *   <li><strong>mechanical:</strong> {@code tensile_strength_ultimate},
     *       {@code yield_strength}, {@code hardness_vickers},
     *       {@code elastic_modulus}, {@code fracture_toughness}</li>
     *   <li><strong>electrical:</strong> {@code electrical_resistivity},
     *       {@code carrier_mobility}, {@code bandgap}</li>
     *   <li><strong>thermal:</strong> {@code thermal_conductivity},
     *       {@code specific_heat_capacity}, {@code melting_point},
     *       {@code thermal_expansion_coefficient}</li>
     *   <li><strong>optical:</strong> {@code refractive_index},
     *       {@code absorption_coefficient}, {@code optical_bandgap}</li>
     *   <li><strong>magnetic:</strong> {@code saturation_magnetization},
     *       {@code coercivity}, {@code relative_permeability},
     *       {@code curie_temperature}</li>
     * </ul>
     */
    @Column(name = "property_name", nullable = false)
    private String propertyName;

    /**
     * High-level property domain.
     * One of: {@code mechanical}, {@code electrical}, {@code thermal},
     * {@code optical}, {@code magnetic}.
     */
    @Column(name = "property_category", nullable = false)
    private String propertyCategory;

    /** Numeric scalar value of the property. */
    @Column(nullable = false)
    private Double value;

    /**
     * Inline CODATA-style uncertainty annotation.
     *
     * <p>Examples:</p>
     * <ul>
     *   <li>{@code ± 5 MPa} — absolute experimental uncertainty</li>
     *   <li>{@code (u_r = 2%)} — relative standard uncertainty</li>
     *   <li>{@code (exact)} — defined value with no uncertainty</li>
     *   <li>{@code N/A} — uncertainty not reported</li>
     * </ul>
     */
    @Column(name = "uncertainty_codata")
    private String uncertaintyCodata;

    /** SI unit string for {@link #value}, e.g. {@code MPa}, {@code W m⁻¹ K⁻¹}. */
    @Column(nullable = false)
    private String unit;

    /**
     * Temperature in Kelvin at which the value was measured or computed.
     * {@code null} implies the standard reference temperature of 298.15 K (25 °C).
     */
    @Column(name = "temperature_k")
    private Double temperatureK;

    /**
     * Additional measurement conditions, e.g. {@code "annealed"},
     * {@code "cold-rolled"}, {@code "doped 1e17 cm⁻³"}.
     */
    private String condition;

    /** Open-source dataset name and DOI/URL used as the data source. */
    private String source;
}
