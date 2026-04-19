package com.atomiccontext.service;

import com.atomiccontext.entity.ParticleProperty;
import com.atomiccontext.repository.ParticlePropertyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.ai.tool.annotation.Tool;
import org.springframework.ai.tool.annotation.ToolParam;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;


/**
 * MCP tool service that exposes fundamental particle properties to AI clients.
 *
 * <p>Particle data is sourced from the Particle Data Group (PDG) and includes
 * mass (with full CODATA uncertainty), spin, electric charge, and lifetime.
 * Two tools are provided:</p>
 * <ul>
 *   <li>{@code get_particle} — exact or fuzzy lookup by particle name</li>
 *   <li>{@code search_particles} — keyword-based discovery by name, symbol, or type</li>
 * </ul>
 */
@Service
@RequiredArgsConstructor
public class ParticleTools {

    /** Repository used to query {@link ParticleProperty} records. */
    private final ParticlePropertyRepository repository;

    /**
     * Returns the PDG properties for a fundamental particle identified by
     * its common name.
     *
     * <p>The lookup first attempts an exact case-insensitive match; if no
     * result is found it falls back to a fuzzy keyword search.</p>
     *
     * @param name particle name, e.g. {@code "electron"}, {@code "muon"},
     *             {@code "Higgs boson"}, {@code "up quark"}
     * @return a formatted string with mass, spin, charge, lifetime, PDG year,
     *         and citable source; or a not-found message with a usage hint
     */
    @Tool(name = "get_particle",
          description = """
          Returns the exact PDG properties for a fundamental particle: mass (CODATA inline notation),
          spin, electric charge, lifetime, and citable PDG source.
          Query by common name: "electron", "proton", "neutron", "muon", "tau",
          "W boson", "Z boson", "Higgs boson", "photon", "up quark", "down quark", etc.
          """)
    public String getParticle(
            @ToolParam(description = "Particle name, e.g. 'electron', 'muon', 'Higgs boson', 'up quark'")
            String name) {
        Optional<ParticleProperty> result = repository.findByNameIgnoreCase(name);
        if (result.isEmpty()) {
            List<ParticleProperty> fuzzy = repository.search(name);
            if (!fuzzy.isEmpty()) {
                return formatParticle(fuzzy.get(0)) +
                       "\n[Fuzzy match — also found: " +
                       fuzzy.stream().skip(1).limit(3)
                            .map(p -> p.getName() + " (" + p.getParticleType() + ")")
                            .collect(Collectors.joining(", ")) + "]";
            }
            return "No particle found matching '" + name + "'. " +
                   "Use search_particles to browse available particles.";
        }
        return formatParticle(result.get());
    }

    /**
     * Searches particle properties by a keyword across name, symbol, and
     * particle-type fields.
     *
     * @param query keyword to search for, e.g. {@code "lepton"}, {@code "quark"},
     *              {@code "boson"}, {@code "charm"}
     * @return a newline-separated summary list, or a not-found message
     */
    @Tool(name = "search_particles",
          description = """
          Searches particle properties by name, symbol, or type.
          Types include: lepton, baryon, meson, boson, quark.
          Example queries: "lepton", "quark", "boson", "charm".
          """)
    public String searchParticles(
            @ToolParam(description = "Keyword: particle name, symbol, or type (e.g. 'lepton', 'quark', 'boson')")
            String query) {
        List<ParticleProperty> results = repository.search(query);
        if (results.isEmpty()) {
            return "No particles found matching '" + query + "'.";
        }
        return results.stream()
                      .map(this::formatParticleSummary)
                      .collect(Collectors.joining("\n"));
    }

    // ---- Formatting helpers ----

    /**
     * Formats a {@link ParticleProperty} into a multi-line detail block.
     *
     * @param p the particle to format
     * @return formatted string with all particle fields
     */
    private String formatParticle(ParticleProperty p) {
        return """
               Particle  : %s (%s)  [%s]
               Mass      : %s
               Spin      : %s
               Charge    : %s  (%s e)
               Lifetime  : %s
               PDG Year  : %d
               Source    : %s
               """.formatted(
                p.getName(), p.getSymbol(), p.getParticleType(),
                p.getMassCodata() != null ? p.getMassCodata() : "N/A",
                p.getSpin(),
                p.getChargeCodata() != null ? p.getChargeCodata() : "N/A",
                p.getChargeE() != null ? p.getChargeE() : "0",
                p.getLifetime() != null ? p.getLifetime() : "N/A",
                p.getPdgYear(),
                p.getSource()
        );
    }

    /**
     * Formats a {@link ParticleProperty} into a concise single-line summary.
     *
     * @param p the particle to format
     * @return one-line bullet summary
     */
    private String formatParticleSummary(ParticleProperty p) {
        return "• %s (%s) [%s] — mass: %s, spin: %s, charge: %s e".formatted(
                p.getName(), p.getSymbol(), p.getParticleType(),
                p.getMassCodata() != null ? p.getMassCodata() : "N/A",
                p.getSpin(),
                p.getChargeE() != null ? p.getChargeE() : "0"
        );
    }
}
