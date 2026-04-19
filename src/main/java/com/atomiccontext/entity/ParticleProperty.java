package com.atomiccontext.entity;

import jakarta.persistence.*;
import lombok.Data;


/**
 * JPA entity representing the physical properties of a fundamental particle.
 *
 * <p>Data is sourced from the Particle Data Group (PDG) and stored using
 * CODATA inline notation for mass and charge so that full uncertainty
 * information is preserved alongside the numeric values.</p>
 */
@Data
@Entity
@Table(name = "particle_properties")
public class ParticleProperty {

    /** Auto-generated primary key. */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /** Common particle name, e.g. {@code "electron"}, {@code "proton"}, {@code "muon"}. */
    @Column(nullable = false, unique = true)
    private String name;

    /** Standard symbol: e⁻, p, μ⁻, etc. */
    private String symbol;

    /** Particle classification: {@code lepton}, {@code baryon}, {@code boson}, {@code quark}. */
    @Column(name = "particle_type")
    private String particleType;

    /**
     * Mass in CODATA inline notation preserving full uncertainty, e.g.
     * {@code "9.109 383 7139 × 10⁻³¹ kg  (u_r = 3.1 × 10⁻¹⁰)"}.
     */
    @Column(name = "mass_codata")
    private String massCodata;

    /** Mass in kilograms as a plain numeric value for sorting or calculation. */
    @Column(name = "mass_kg")
    private Double massKg;

    /** Spin quantum number as a string, e.g. {@code "1/2"}, {@code "1"}, {@code "0"}. */
    private String spin;

    /**
     * Electric charge in CODATA notation, e.g.
     * {@code "-1.602 176 634 × 10⁻¹⁹ C (exact)"}.
     */
    @Column(name = "charge_codata")
    private String chargeCodata;

    /**
     * Electric charge expressed in units of the elementary charge, e.g.
     * {@code "-1"}, {@code "+1"}, {@code "2/3"}, {@code "-1/3"}.
     */
    @Column(name = "charge_e")
    private String chargeE;

    /**
     * Mean lifetime in CODATA notation, or {@code "stable"} for stable particles.
     */
    private String lifetime;

    /** PDG citation, e.g. {@code "PDG 2024 — https://pdg.lbl.gov"}. */
    private String source;

    /** Year of the PDG Review of Particle Physics edition used as source. */
    @Column(name = "pdg_year")
    private Integer pdgYear;
}
