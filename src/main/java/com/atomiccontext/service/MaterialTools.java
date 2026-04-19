package com.atomiccontext.service;

import com.atomiccontext.entity.Material;
import com.atomiccontext.entity.MaterialProperty;
import com.atomiccontext.repository.MaterialPropertyRepository;
import com.atomiccontext.repository.MaterialRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.ai.tool.annotation.ToolParam;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


/**
 * MCP tool service that exposes material property data to AI clients.
 *
 * <p>Material data is sourced from open databases such as AFLOW, OQMD,
 * Materials Project, and NIST. Four tools are provided:</p>
 * <ul>
 *   <li>{@code get_material_property} — retrieve a specific property value
 *       for a named material, optionally at a given temperature</li>
 *   <li>{@code search_materials} — keyword-based material discovery with
 *       optional category filter</li>
 *   <li>{@code list_material_properties} — enumerate all available properties
 *       for a material before querying values</li>
 *   <li>{@code get_material_properties_by_category} — bulk retrieval of all
 *       properties in one category (e.g. all thermal properties)</li>
 * </ul>
 */
@Service
@RequiredArgsConstructor
public class MaterialTools {

    /** Repository used to query {@link Material} records. */
    private final MaterialRepository materialRepository;

    /** Repository used to query {@link MaterialProperty} records. */
    private final MaterialPropertyRepository propertyRepository;

    /**
     * Returns one or more property values for a material, with uncertainty,
     * unit, measurement temperature, condition, and citable reference.
     *
     * <p>When {@code temperatureK} is provided the search first looks within
     * ±25 K of the target; if no results are found the tolerance is widened
     * to ±100 K.</p>
     *
     * @param material      material name, e.g. {@code "Silicon"}, {@code "Ti-6Al-4V"}
     * @param propertyName  property name, e.g. {@code "tensile_strength_ultimate"},
     *                      {@code "refractive_index"}
     * @param temperatureK  measurement temperature in Kelvin, or {@code null} for
     *                      room temperature (298.15 K)
     * @return formatted property block(s) or an informative not-found message
     */
    @Tool(name = "get_material_property",
          description = """
          Returns one or more property values for a material, with inline uncertainty notation,
          unit, measurement temperature, condition, and citable open-source reference.
          property_name examples:
            mechanical:  tensile_strength_ultimate, yield_strength, hardness_vickers,
                         elastic_modulus, fracture_toughness, elongation_at_break
            electrical:  electrical_resistivity, carrier_mobility, bandgap, conductivity
            thermal:     thermal_conductivity, specific_heat_capacity, melting_point,
                         thermal_expansion_coefficient, curie_temperature
            optical:     refractive_index, absorption_coefficient, optical_bandgap
            magnetic:    saturation_magnetization, coercivity, relative_permeability
          material examples: "Aluminum 6061", "Silicon", "Alumina", "Nickel", "Ti-6Al-4V",
                             "316L Stainless Steel", "GaAs", "SiC", "Inconel 625"
          """)
    public String getMaterialProperty(
            @ToolParam(description = "Material name, e.g. 'Silicon', 'Ti-6Al-4V', '316L Stainless Steel'")
            String material,
            @ToolParam(description = "Property name, e.g. 'tensile_strength_ultimate', 'refractive_index', 'electrical_resistivity'")
            String propertyName,
            @ToolParam(description = "Temperature in Kelvin (optional; use null or 298.15 for room temperature)")
            Double temperatureK) {
        List<Material> candidates = materialRepository.search(material);
        if (candidates.isEmpty()) {
            return "Material '" + material + "' not found. Use search_materials to browse available materials.";
        }
        Material mat = candidates.get(0);
        List<MaterialProperty> props;
        if (temperatureK != null) {
            // Look within 25 K of requested temperature
            props = propertyRepository.findByMaterialIdAndPropertyNameNearTemperature(
                    mat.getId(), propertyName, temperatureK, 25.0);
            if (props.isEmpty()) {
                // Widen to 100 K
                props = propertyRepository.findByMaterialIdAndPropertyNameNearTemperature(
                        mat.getId(), propertyName, temperatureK, 100.0);
            }
        } else {
            props = propertyRepository.findByMaterialIdAndPropertyName(mat.getId(), propertyName);
        }
        if (props.isEmpty()) {
            List<String> available = propertyRepository.findDistinctPropertyNamesByMaterialId(mat.getId());
            return "Property '%s' not found for '%s'.\nAvailable properties: %s"
                    .formatted(propertyName, mat.getName(), String.join(", ", available));
        }
        String header = "Material: %s (%s) [%s] — source: %s\n".formatted(
                mat.getName(), mat.getComposition(), mat.getCategory(), mat.getSourceDb());
        String rows = props.stream().map(this::formatProperty).collect(Collectors.joining("\n"));
        String candidateNote = candidates.size() > 1
                ? "\n[Also matched: " + candidates.stream().skip(1).limit(3)
                        .map(Material::getName).collect(Collectors.joining(", ")) + "]"
                : "";
        return header + rows + candidateNote;
    }

    /**
     * Searches the materials database by name, composition, or sub-category,
     * with an optional top-level category filter.
     *
     * @param query    keyword to search for (name, element, or composition)
     * @param category optional category filter: {@code metal}, {@code alloy},
     *                 {@code semiconductor}, {@code ceramic}; pass {@code null} for all
     * @return newline-separated material summaries, or a not-found message
     */
    @Tool(name = "search_materials",
          description = """
          Searches the materials database by name, composition, or sub-category.
          Optionally filter by category: metal, alloy, semiconductor, ceramic.
          Returns material name, composition, category, crystal structure, and data source.
          Examples: "steel", "GaAs", "titanium alloy", "oxide ceramic", "nickel superalloy"
          """)
    public String searchMaterials(
            @ToolParam(description = "Search keyword: material name, element, or composition")
            String query,
            @ToolParam(description = "Optional category filter: metal | alloy | semiconductor | ceramic (pass null for all)")
            String category) {
        List<Material> results;
        if (category != null && !category.isBlank()) {
            results = materialRepository.searchByCategory(query, category);
        } else {
            results = materialRepository.search(query);
        }
        if (results.isEmpty()) {
            return "No materials found matching '" + query + "'" +
                   (category != null ? " in category '" + category + "'" : "") + ".";
        }
        return results.stream().map(this::formatMaterialSummary).collect(Collectors.joining("\n"));
    }

    /**
     * Lists all available property names and categories for a given material,
     * useful for discovering what data exists before calling
     * {@code get_material_property}.
     *
     * @param material material name, e.g. {@code "Silicon"}, {@code "Inconel 625"}
     * @return a formatted summary of available categories and property names,
     *         or a not-found message
     */
    @Tool(name = "list_material_properties",
          description = """
          Lists all available property names and their categories for a given material.
          Useful before calling get_material_property to know what data is available.
          """)
    public String listMaterialProperties(
            @ToolParam(description = "Material name, e.g. 'Silicon', 'Inconel 625'")
            String material) {
        List<Material> candidates = materialRepository.search(material);
        if (candidates.isEmpty()) {
            return "Material '" + material + "' not found.";
        }
        Material mat = candidates.get(0);
        List<String> names = propertyRepository.findDistinctPropertyNamesByMaterialId(mat.getId());
        List<String> cats = propertyRepository.findDistinctPropertyCategoriesByMaterialId(mat.getId());
        return "Material: %s (%s)\nProperty categories: %s\nAvailable properties:\n  %s".formatted(
                mat.getName(), mat.getCategory(),
                String.join(", ", cats),
                String.join("\n  ", names));
    }

    /**
     * Returns all properties belonging to a given category for a material in
     * a single call.
     *
     * @param material         material name, e.g. {@code "Silicon"}, {@code "Ti-6Al-4V"}
     * @param propertyCategory category to retrieve: {@code mechanical}, {@code electrical},
     *                         {@code thermal}, {@code optical}, or {@code magnetic}
     * @return formatted property rows, or a not-found message
     */
    @Tool(name = "get_material_properties_by_category",
          description = """
          Returns ALL properties of a given category for a material in one call.
          category: mechanical | electrical | thermal | optical | magnetic
          """)
    public String getMaterialPropertiesByCategory(
            @ToolParam(description = "Material name, e.g. 'Silicon', 'Ti-6Al-4V'")
            String material,
            @ToolParam(description = "Property category: mechanical | electrical | thermal | optical | magnetic")
            String propertyCategory) {
        List<Material> candidates = materialRepository.search(material);
        if (candidates.isEmpty()) {
            return "Material '" + material + "' not found.";
        }
        Material mat = candidates.get(0);
        List<MaterialProperty> props = propertyRepository.findByMaterialIdAndCategory(
                mat.getId(), propertyCategory);
        if (props.isEmpty()) {
            return "No " + propertyCategory + " properties found for '" + mat.getName() + "'.";
        }
        String header = "Material: %s (%s) [%s] — %s properties\n".formatted(
                mat.getName(), mat.getComposition(), mat.getCategory(), propertyCategory);
        return header + props.stream().map(this::formatProperty).collect(Collectors.joining("\n"));
    }

    // ---- Formatting helpers ----

    /**
     * Formats a {@link MaterialProperty} into a single tabular row.
     *
     * @param mp the property to format
     * @return formatted row string
     */
    private String formatProperty(MaterialProperty mp) {
        return "  %-45s = %-14.6g %-20s  %s  @ %.1f K  [%s]  source: %s".formatted(
                mp.getPropertyName(),
                mp.getValue(),
                mp.getUnit(),
                mp.getUncertaintyCodata() != null ? mp.getUncertaintyCodata() : "",
                mp.getTemperatureK() != null ? mp.getTemperatureK() : 298.15,
                mp.getCondition() != null ? mp.getCondition() : "standard",
                mp.getSource() != null ? mp.getSource() : "N/A"
        );
    }

    /**
     * Formats a {@link Material} into a concise single-line summary.
     *
     * @param m the material to format
     * @return one-line bullet summary
     */
    private String formatMaterialSummary(Material m) {
        return "• %-40s %-12s %-25s crystal: %-15s source: %s".formatted(
                m.getName(),
                m.getCategory(),
                m.getComposition() != null ? m.getComposition() : "",
                m.getCrystalStructure() != null ? m.getCrystalStructure() : "N/A",
                m.getSourceDb() != null ? m.getSourceDb() : "N/A"
        );
    }
}
