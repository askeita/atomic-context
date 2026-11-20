package com.atomiccontext.service;

import com.atomiccontext.entity.Material;
import com.atomiccontext.entity.MaterialProperty;
import com.atomiccontext.repository.MaterialPropertyRepository;
import com.atomiccontext.repository.MaterialRepository;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.*;

class MaterialToolsTest {

    private final MaterialRepository materialRepository = mock(MaterialRepository.class);
    private final MaterialPropertyRepository propertyRepository = mock(MaterialPropertyRepository.class);
    private final MaterialTools tools = new MaterialTools(materialRepository, propertyRepository);

    @Test
    void getMaterialPropertyReturnsMatchingProperty() {
        Material material = material("Silicon");
        MaterialProperty property = new MaterialProperty();
        property.setPropertyName("thermal_conductivity");
        property.setValue(148.0);
        property.setUnit("W m^-1 K^-1");
        when(materialRepository.search("Silicon")).thenReturn(List.of(material));
        when(propertyRepository.findByMaterialIdAndPropertyName(1L, "thermal_conductivity"))
                .thenReturn(List.of(property));

        String result = tools.getMaterialProperty("Silicon", "thermal_conductivity", null);

        assertTrue(result.contains("Material: Silicon"));
        assertTrue(result.contains("148"));
    }

    @Test
    void getMaterialPropertyReportsMissingMaterialOrProperty() {
        when(materialRepository.search("unknown")).thenReturn(List.of());
        Material material = material("Silicon");
        when(materialRepository.search("Silicon")).thenReturn(List.of(material));
        when(propertyRepository.findByMaterialIdAndPropertyName(1L, "unknown")).thenReturn(List.of());
        when(propertyRepository.findDistinctPropertyNamesByMaterialId(1L)).thenReturn(List.of("bandgap"));

        assertTrue(tools.getMaterialProperty("unknown", "bandgap", null).contains("not found"));
        assertTrue(tools.getMaterialProperty("Silicon", "unknown", null).contains("Available properties: bandgap"));
    }

    private static Material material(String name) {
        Material material = new Material();
        material.setId(1L);
        material.setName(name);
        material.setComposition("Si");
        material.setCategory("semiconductor");
        material.setSourceDb("NSM Archive");
        return material;
    }
}
