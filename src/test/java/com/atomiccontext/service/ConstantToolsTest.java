package com.atomiccontext.service;

import com.atomiccontext.entity.PhysicalConstant;
import com.atomiccontext.repository.PhysicalConstantRepository;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.*;

class ConstantToolsTest {

    private final PhysicalConstantRepository repository = mock(PhysicalConstantRepository.class);
    private final ConstantTools tools = new ConstantTools(repository);

    @Test
    void getConstantReturnsExactMatch() {
        PhysicalConstant constant = constant("h", "Planck constant");
        when(repository.findBySymbolIgnoreCase("h")).thenReturn(Optional.of(constant));

        String result = tools.getConstant("h");

        assertTrue(result.contains("Planck constant (h)"));
        verify(repository, never()).search(anyString());
    }

    @Test
    void getConstantFallsBackToSearchAndReportsMissingValues() {
        when(repository.search("unknown")).thenReturn(List.of());
        when(repository.search("light")).thenReturn(List.of(constant("c", "speed of light")));

        assertTrue(tools.getConstant("unknown").contains("No constant found"));
        assertTrue(tools.getConstant("light").contains("Fuzzy match"));
    }

    private static PhysicalConstant constant(String symbol, String name) {
        PhysicalConstant constant = new PhysicalConstant();
        constant.setSymbol(symbol);
        constant.setName(name);
        constant.setValueCodata("6.626 × 10^-34");
        constant.setCategory("universal");
        constant.setCodataYear(2022);
        constant.setSource("NIST");
        return constant;
    }
}
