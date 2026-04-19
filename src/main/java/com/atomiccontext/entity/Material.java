package com.atomiccontext.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;


/**
 * JPA entity representing a material in the materials database.
 *
 * <p>Materials can be metals, alloys, semiconductors, or ceramics. Each
 * material may have many associated {@link MaterialProperty} records
 * covering mechanical, electrical, thermal, optical, and magnetic data.</p>
 */
@Data
@Entity
@Table(name = "materials")
public class Material {

    /** Auto-generated primary key. */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /** Common name, e.g. "Aluminum 6061", "Silicon", "Alumina (Al2O3)". */
    @Column(nullable = false)
    private String name;

    /** Chemical formula or composition, e.g. "Al-Mg-Si", "Si", "Al2O3". */
    private String composition;

    /** Top-level category: {@code metal}, {@code alloy}, {@code semiconductor}, or {@code ceramic}. */
    @Column(nullable = false)
    private String category;

    /** Sub-category, e.g. "ferrous alloy", "III-V semiconductor", "oxide ceramic". */
    @Column(name = "sub_category")
    private String subCategory;

    /** Crystal structure: FCC, BCC, HCP, diamond cubic, etc. */
    @Column(name = "crystal_structure")
    private String crystalStructure;

    /** Data provenance flag: {@code experimental}, {@code computed}, or {@code mixed}. */
    @Column(name = "data_type")
    private String dataType;

    /** Primary open-source database: AFLOW, OQMD, Materials Project, NIST, NSM. */
    @Column(name = "source_db")
    private String sourceDb;

    /** All measured/computed properties associated with this material. */
    @OneToMany(mappedBy = "material", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<MaterialProperty> properties;
}
