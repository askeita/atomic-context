package com.atomiccontext.service;

import com.atomiccontext.entity.ParticleProperty;
import com.atomiccontext.repository.ParticlePropertyRepository;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.*;

class ParticleToolsTest {

    private final ParticlePropertyRepository repository = mock(ParticlePropertyRepository.class);
    private final ParticleTools tools = new ParticleTools(repository);

    @Test
    void getParticleReturnsExactMatch() {
        ParticleProperty particle = particle("electron");
        when(repository.findByNameIgnoreCase("electron")).thenReturn(Optional.of(particle));

        String result = tools.getParticle("electron");

        assertTrue(result.contains("Particle  : electron"));
        assertTrue(result.contains("Source    : PDG 2024"));
        verify(repository, never()).search(anyString());
    }

    @Test
    void getParticleUsesFuzzyMatchOrReturnsNotFound() {
        when(repository.search("lepton")).thenReturn(List.of(particle("electron")));
        when(repository.search("unknown")).thenReturn(List.of());

        assertTrue(tools.getParticle("lepton").contains("Fuzzy match"));
        assertTrue(tools.getParticle("unknown").contains("No particle found"));
    }

    private static ParticleProperty particle(String name) {
        ParticleProperty particle = new ParticleProperty();
        particle.setName(name);
        particle.setSymbol("e^-");
        particle.setParticleType("lepton");
        particle.setMassCodata("9.1 × 10^-31 kg");
        particle.setSpin("1/2");
        particle.setChargeE("-1");
        particle.setPdgYear(2024);
        particle.setSource("PDG 2024");
        return particle;
    }
}
