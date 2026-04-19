package com.atomiccontext.entity;

import jakarta.persistence.*;
import lombok.Data;


/**
 * JPA entity representing a fundamental physical constant from the CODATA
 * recommended values.
 *
 * <p>Values are stored both as CODATA inline notation (preserving the full
 * uncertainty string) and as a plain {@code double} for numeric
 * operations such as sorting and filtering.</p>
 */
@Data
@Entity
@Table(name = "physical_constants")
public class PhysicalConstant {

    /** Auto-generated primary key. */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /** IUPAC/CODATA symbol, e.g. {@code "c"}, {@code "h"}, {@code "e"}. */
    @Column(nullable = false, unique = true)
    private String symbol;

    /** Full descriptive name, e.g. {@code "speed of light in vacuum"}. */
    @Column(nullable = false)
    private String name;

    /**
     * Value in CODATA inline notation, e.g. {@code "299 792 458 (exact)"}.
     * Includes the numeric digits, the power-of-ten factor, and the
     * uncertainty annotation.
     */
    @Column(name = "value_codata", nullable = false)
    private String valueCodata;

    /**
     * Numeric value extracted from {@link #valueCodata} for use in
     * sorting, range queries, and calculations.
     */
    @Column(name = "value_numeric")
    private Double valueNumeric;

    /** SI unit string, e.g. {@code "m s⁻¹"}, {@code "J s"}, {@code "C"}. */
    private String unit;

    /**
     * Relative standard uncertainty, e.g. {@code "0 (exact)"} for defined
     * constants or a numeric string such as {@code "1.5e-10"}.
     */
    private String uncertainty;

    /** Citable source including DOI, e.g. {@code "NIST CODATA 2022 — https://doi.org/10.18434/T4WW24"}. */
    private String source;

    /** Year of the CODATA adjustment from which this value was taken. */
    @Column(name = "codata_year")
    private Integer codataYear;

    /**
     * Thematic group for discovery and filtering.
     * One of: {@code universal}, {@code electromagnetic}, {@code atomic},
     * {@code physico-chemical}.
     */
    private String category;
}
