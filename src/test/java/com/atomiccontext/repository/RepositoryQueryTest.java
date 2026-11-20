package com.atomiccontext.repository;

import com.atomiccontext.entity.Material;
import com.atomiccontext.entity.MaterialProperty;
import com.atomiccontext.entity.PhysicalConstant;
import com.atomiccontext.integration.SeededApplicationIntegrationTest;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.jupiter.api.Assertions.assertEquals;

class RepositoryQueryTest extends SeededApplicationIntegrationTest {

    @Autowired
    private PhysicalConstantRepository constantRepository;

    @Autowired
    private MaterialRepository materialRepository;

    @Autowired
    private MaterialPropertyRepository propertyRepository;

    @Test
    void repositoryLookupsAndCustomQueriesUseTheIsolatedDatabase() {
        PhysicalConstant constant = new PhysicalConstant();
        constant.setSymbol("test_h");
        constant.setName("repository-only-search-probe");
        constant.setValueCodata("6.626 × 10^-34");
        constant.setValueNumeric(6.626e-34);
        constant.setUnit("J s");
        constant.setSource("test fixture");
        constant.setCategory("test");
        constantRepository.saveAndFlush(constant);

        assertEquals("test_h",
                constantRepository.findBySymbolIgnoreCase("TEST_H").orElseThrow().getSymbol());
        assertEquals(1, constantRepository.search("repository-only-search-probe").size());

        Material material = new Material();
        material.setName("Repository Only Silicon Probe");
        material.setComposition("Si");
        material.setCategory("semiconductor");
        material.setSubCategory("group-IV semiconductor");
        material.setSourceDb("test fixture");
        material = materialRepository.saveAndFlush(material);

        assertEquals(1,
                materialRepository.searchByCategory("Repository Only Silicon Probe", "SEMICONDUCTOR").size());

        MaterialProperty property = new MaterialProperty();
        property.setMaterial(material);
        property.setPropertyName("thermal_conductivity");
        property.setPropertyCategory("thermal");
        property.setValue(148.0);
        property.setUnit("W m^-1 K^-1");
        property.setSource("test fixture");
        property.setTemperatureK(310.0);
        propertyRepository.saveAndFlush(property);

        assertEquals(1, propertyRepository.findByMaterialIdAndPropertyNameNearTemperature(
                material.getId(), "conductivity", 300.0, 25.0).size());
        assertEquals(1, propertyRepository.findByMaterialIdAndCategory(
                material.getId(), "THERMAL").size());
    }
}
