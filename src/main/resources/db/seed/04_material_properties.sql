-- Material properties seed
-- All INSERT OR IGNORE — idempotent, safe to re-run.
-- Joins via subquery on materials.name (unique in catalog).
-- Sources cited per row.
-- ═══════════════════════════════════════════════════════════════════════════
-- PURE METALS
-- ═══════════════════════════════════════════════════════════════════════════
-- ── Aluminum (pure) ─────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',70.0,'(+/-2 GPa)','GPa',298.15,'annealed','NIST WebBook SRD 69 — https://webbook.nist.gov' FROM materials WHERE name='Aluminum (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'tensile_strength_ultimate','mechanical',90.0,'(+/-5 MPa)','MPa',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Aluminum (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'yield_strength','mechanical',35.0,'(+/-3 MPa)','MPa',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Aluminum (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',2.65e-8,'(u_r=1%)','Ohm m',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Aluminum (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',237.0,'(+/-3 W/mK)','W m^-1 K^-1',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Aluminum (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'specific_heat_capacity','thermal',900.0,'(+/-5 J/kgK)','J kg^-1 K^-1',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Aluminum (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'melting_point','thermal',933.47,'(+/-0.1 K)','K',NULL,'1 atm','NIST WebBook SRD 69' FROM materials WHERE name='Aluminum (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_expansion_coefficient','thermal',23.1e-6,'(u_r=2%)','K^-1',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Aluminum (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'refractive_index','optical',1.44,'(+/-0.05)','dimensionless',298.15,'at 500 nm wavelength','refractiveindex.info — https://refractiveindex.info' FROM materials WHERE name='Aluminum (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'relative_permeability','magnetic',1.000022,'(u_r=0.01%)','dimensionless',298.15,'pure, low-field','NIST / AFLOW' FROM materials WHERE name='Aluminum (pure)';
-- ── Copper (pure) ───────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',128.0,'(+/-2 GPa)','GPa',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Copper (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'tensile_strength_ultimate','mechanical',210.0,'(+/-10 MPa)','MPa',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Copper (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'yield_strength','mechanical',70.0,'(+/-5 MPa)','MPa',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Copper (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',1.72e-8,'(u_r=0.5%)','Ohm m',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Copper (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',400.0,'(+/-5 W/mK)','W m^-1 K^-1',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Copper (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'specific_heat_capacity','thermal',385.0,'(+/-2 J/kgK)','J kg^-1 K^-1',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Copper (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'melting_point','thermal',1357.77,'(+/-0.1 K)','K',NULL,'1 atm','NIST WebBook SRD 69' FROM materials WHERE name='Copper (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_expansion_coefficient','thermal',16.5e-6,'(u_r=2%)','K^-1',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Copper (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'refractive_index','optical',1.17,'(+/-0.05)','dimensionless',298.15,'at 632.8 nm','refractiveindex.info' FROM materials WHERE name='Copper (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'relative_permeability','magnetic',0.999994,'(u_r=0.001%)','dimensionless',298.15,'pure, low-field','NIST / AFLOW' FROM materials WHERE name='Copper (pure)';
-- ── Iron (pure) ─────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',211.0,'(+/-3 GPa)','GPa',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Iron (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'tensile_strength_ultimate','mechanical',350.0,'(+/-15 MPa)','MPa',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Iron (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',1.0e-7,'(u_r=2%)','Ohm m',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Iron (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',80.2,'(+/-1 W/mK)','W m^-1 K^-1',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Iron (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'melting_point','thermal',1811.0,'(+/-2 K)','K',NULL,'1 atm','NIST WebBook SRD 69' FROM materials WHERE name='Iron (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'saturation_magnetization','magnetic',1.707e6,'(u_r=1%)','A m^-1',298.15,'pure alpha-Fe','NIST / AFLOW' FROM materials WHERE name='Iron (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'curie_temperature','magnetic',1043.0,'(+/-2 K)','K',NULL,'pure','NIST / Materials Project' FROM materials WHERE name='Iron (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'relative_permeability','magnetic',5000.0,'(order of magnitude; depends on field)','dimensionless',298.15,'pure annealed, low-field max','NIST' FROM materials WHERE name='Iron (pure)';
-- ── Nickel (pure) ───────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',200.0,'(+/-3 GPa)','GPa',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Nickel (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',6.99e-8,'(u_r=1%)','Ohm m',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Nickel (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',90.7,'(+/-1 W/mK)','W m^-1 K^-1',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Nickel (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'melting_point','thermal',1728.0,'(+/-2 K)','K',NULL,'1 atm','NIST WebBook SRD 69' FROM materials WHERE name='Nickel (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'saturation_magnetization','magnetic',4.9e5,'(u_r=2%)','A m^-1',298.15,'pure','NIST / Materials Project' FROM materials WHERE name='Nickel (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'curie_temperature','magnetic',627.0,'(+/-2 K)','K',NULL,'pure','NIST / Materials Project' FROM materials WHERE name='Nickel (pure)';
-- ── Titanium (pure) ─────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',116.0,'(+/-2 GPa)','GPa',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Titanium (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'tensile_strength_ultimate','mechanical',434.0,'(+/-10 MPa)','MPa',298.15,'annealed grade 2','NIST WebBook SRD 69' FROM materials WHERE name='Titanium (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',4.20e-7,'(u_r=2%)','Ohm m',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Titanium (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',21.9,'(+/-0.5 W/mK)','W m^-1 K^-1',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Titanium (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'melting_point','thermal',1941.0,'(+/-2 K)','K',NULL,'1 atm','NIST WebBook SRD 69' FROM materials WHERE name='Titanium (pure)';
-- ── Tungsten (pure) ─────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',411.0,'(+/-5 GPa)','GPa',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Tungsten (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'tensile_strength_ultimate','mechanical',1510.0,'(+/-50 MPa)','MPa',298.15,'sintered','NIST WebBook SRD 69' FROM materials WHERE name='Tungsten (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',5.28e-8,'(u_r=1%)','Ohm m',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Tungsten (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',174.0,'(+/-2 W/mK)','W m^-1 K^-1',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Tungsten (pure)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'melting_point','thermal',3695.0,'(+/-15 K)','K',NULL,'1 atm — highest melting point of all metals','NIST WebBook SRD 69' FROM materials WHERE name='Tungsten (pure)';
-- ═══════════════════════════════════════════════════════════════════════════
-- KEY ALLOYS
-- ═══════════════════════════════════════════════════════════════════════════
-- ── Ti-6Al-4V ───────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',114.0,'(+/-2 GPa)','GPa',298.15,'annealed','NIST WebBook SRD 69 / AFLOW' FROM materials WHERE name='Ti-6Al-4V (Grade 5)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'tensile_strength_ultimate','mechanical',950.0,'(+/-20 MPa)','MPa',298.15,'annealed','NIST WebBook SRD 69 / AFLOW' FROM materials WHERE name='Ti-6Al-4V (Grade 5)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'yield_strength','mechanical',880.0,'(+/-20 MPa)','MPa',298.15,'annealed','NIST / AFLOW' FROM materials WHERE name='Ti-6Al-4V (Grade 5)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'fracture_toughness','mechanical',75.0,'(+/-5 MPa sqrt(m))','MPa m^0.5',298.15,'annealed','NIST / AFLOW' FROM materials WHERE name='Ti-6Al-4V (Grade 5)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elongation_at_break','mechanical',14.0,'(+/-2%)','%',298.15,'annealed','NIST / AFLOW' FROM materials WHERE name='Ti-6Al-4V (Grade 5)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',1.71e-6,'(u_r=3%)','Ohm m',298.15,'annealed','NIST / AFLOW' FROM materials WHERE name='Ti-6Al-4V (Grade 5)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',6.7,'(+/-0.3 W/mK)','W m^-1 K^-1',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Ti-6Al-4V (Grade 5)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'specific_heat_capacity','thermal',560.0,'(+/-10 J/kgK)','J kg^-1 K^-1',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='Ti-6Al-4V (Grade 5)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_expansion_coefficient','thermal',8.6e-6,'(u_r=3%)','K^-1',298.15,'annealed','NIST / AFLOW' FROM materials WHERE name='Ti-6Al-4V (Grade 5)';
-- ── 316L Stainless Steel ────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',193.0,'(+/-3 GPa)','GPa',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='316L Stainless Steel';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'tensile_strength_ultimate','mechanical',579.0,'(+/-15 MPa)','MPa',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='316L Stainless Steel';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'yield_strength','mechanical',290.0,'(+/-15 MPa)','MPa',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='316L Stainless Steel';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',7.4e-7,'(u_r=2%)','Ohm m',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='316L Stainless Steel';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',16.2,'(+/-0.5 W/mK)','W m^-1 K^-1',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='316L Stainless Steel';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'specific_heat_capacity','thermal',500.0,'(+/-10 J/kgK)','J kg^-1 K^-1',298.15,'annealed','NIST WebBook SRD 69' FROM materials WHERE name='316L Stainless Steel';
-- ── Inconel 625 ─────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',208.0,'(+/-3 GPa)','GPa',298.15,'annealed','NIST / AFLOW' FROM materials WHERE name='Inconel 625';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'tensile_strength_ultimate','mechanical',930.0,'(+/-20 MPa)','MPa',298.15,'annealed','NIST / AFLOW' FROM materials WHERE name='Inconel 625';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'yield_strength','mechanical',517.0,'(+/-20 MPa)','MPa',298.15,'annealed','NIST / AFLOW' FROM materials WHERE name='Inconel 625';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',9.8,'(+/-0.5 W/mK)','W m^-1 K^-1',298.15,'annealed','NIST / AFLOW' FROM materials WHERE name='Inconel 625';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',1.29e-6,'(u_r=2%)','Ohm m',298.15,'annealed','NIST / AFLOW' FROM materials WHERE name='Inconel 625';
-- ── Aluminum 6061-T6 ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',68.9,'(+/-1 GPa)','GPa',298.15,'T6 temper','NIST / AFLOW' FROM materials WHERE name='Aluminum 6061-T6';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'tensile_strength_ultimate','mechanical',310.0,'(+/-10 MPa)','MPa',298.15,'T6 temper','NIST / AFLOW' FROM materials WHERE name='Aluminum 6061-T6';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'yield_strength','mechanical',276.0,'(+/-10 MPa)','MPa',298.15,'T6 temper','NIST / AFLOW' FROM materials WHERE name='Aluminum 6061-T6';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',3.99e-8,'(u_r=2%)','Ohm m',298.15,'T6 temper','NIST / AFLOW' FROM materials WHERE name='Aluminum 6061-T6';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',167.0,'(+/-3 W/mK)','W m^-1 K^-1',298.15,'T6 temper','NIST WebBook SRD 69' FROM materials WHERE name='Aluminum 6061-T6';
-- ═══════════════════════════════════════════════════════════════════════════
-- SEMICONDUCTORS
-- ═══════════════════════════════════════════════════════════════════════════
-- ── Silicon ─────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'bandgap','electrical',1.1242,'(+/-0.0002 eV)','eV',300.0,'intrinsic, indirect','NSM Archive — https://www.ioffe.ru/SVA/NSM/Semicond/Si' FROM materials WHERE name='Silicon';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'bandgap','electrical',1.170,'(+/-0.002 eV)','eV',0.0,'intrinsic, 0 K extrapolation','NSM Archive' FROM materials WHERE name='Silicon';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'carrier_mobility','electrical',1400.0,'(+/-50 cm^2/Vs)','cm^2 V^-1 s^-1',300.0,'intrinsic electrons','NSM Archive' FROM materials WHERE name='Silicon';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'carrier_mobility','electrical',450.0,'(+/-20 cm^2/Vs)','cm^2 V^-1 s^-1',300.0,'intrinsic holes','NSM Archive' FROM materials WHERE name='Silicon';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',2300.0,'(order of magnitude; depends on doping)','Ohm m',300.0,'intrinsic','NSM Archive' FROM materials WHERE name='Silicon';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',130.0,'(+/-2 GPa, [100] direction)','GPa',298.15,'single crystal','NSM Archive / Materials Project' FROM materials WHERE name='Silicon';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',148.0,'(+/-2 W/mK)','W m^-1 K^-1',300.0,'pure','NSM Archive / NIST' FROM materials WHERE name='Silicon';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'specific_heat_capacity','thermal',703.0,'(+/-5 J/kgK)','J kg^-1 K^-1',298.15,'pure','NIST WebBook SRD 69' FROM materials WHERE name='Silicon';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'melting_point','thermal',1687.0,'(+/-2 K)','K',NULL,'1 atm','NIST WebBook SRD 69' FROM materials WHERE name='Silicon';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'refractive_index','optical',3.4179,'(+/-0.0002 at 1 um)','dimensionless',300.0,'at 1000 nm','refractiveindex.info — https://refractiveindex.info/?shelf=main&book=Si&page=Aspnes' FROM materials WHERE name='Silicon';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'optical_bandgap','optical',1.1242,'(+/-0.0002 eV)','eV',300.0,'indirect','NSM Archive' FROM materials WHERE name='Silicon';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'relative_permeability','magnetic',1.0000,'(exact, diamagnetic)','dimensionless',298.15,'pure','NSM Archive' FROM materials WHERE name='Silicon';
-- ── GaAs ────────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'bandgap','electrical',1.424,'(+/-0.001 eV)','eV',300.0,'intrinsic, direct','NSM Archive — https://www.ioffe.ru/SVA/NSM/Semicond/GaAs' FROM materials WHERE name='Gallium Arsenide (GaAs)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'bandgap','electrical',1.519,'(+/-0.001 eV)','eV',0.0,'0 K extrapolation, direct','NSM Archive' FROM materials WHERE name='Gallium Arsenide (GaAs)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'carrier_mobility','electrical',8500.0,'(+/-200 cm^2/Vs)','cm^2 V^-1 s^-1',300.0,'intrinsic electrons','NSM Archive' FROM materials WHERE name='Gallium Arsenide (GaAs)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'carrier_mobility','electrical',400.0,'(+/-20 cm^2/Vs)','cm^2 V^-1 s^-1',300.0,'intrinsic holes','NSM Archive' FROM materials WHERE name='Gallium Arsenide (GaAs)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',46.0,'(+/-1 W/mK)','W m^-1 K^-1',300.0,'pure','NSM Archive' FROM materials WHERE name='Gallium Arsenide (GaAs)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'refractive_index','optical',3.655,'(+/-0.005 at 1 um)','dimensionless',300.0,'at 1000 nm, below gap','refractiveindex.info — https://refractiveindex.info/?shelf=main&book=GaAs&page=Skauli' FROM materials WHERE name='Gallium Arsenide (GaAs)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'melting_point','thermal',1511.0,'(+/-2 K)','K',NULL,'1 atm','NIST WebBook SRD 69' FROM materials WHERE name='Gallium Arsenide (GaAs)';
-- ── GaN ─────────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'bandgap','electrical',3.40,'(+/-0.02 eV)','eV',300.0,'intrinsic, direct','NSM Archive — https://www.ioffe.ru/SVA/NSM/Semicond/GaN' FROM materials WHERE name='Gallium Nitride (GaN)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'carrier_mobility','electrical',1000.0,'(+/-100 cm^2/Vs, 2DEG in HEMT)','cm^2 V^-1 s^-1',300.0,'2DEG HEMT structure','NSM Archive' FROM materials WHERE name='Gallium Nitride (GaN)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',130.0,'(+/-10 W/mK)','W m^-1 K^-1',300.0,'bulk','NSM Archive' FROM materials WHERE name='Gallium Nitride (GaN)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'refractive_index','optical',2.35,'(+/-0.02 at 500 nm)','dimensionless',300.0,'at 500 nm','refractiveindex.info' FROM materials WHERE name='Gallium Nitride (GaN)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',295.0,'(+/-5 GPa)','GPa',298.15,'bulk c-plane','NSM Archive / Materials Project' FROM materials WHERE name='Gallium Nitride (GaN)';
-- ── 4H-SiC ──────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'bandgap','electrical',3.26,'(+/-0.01 eV)','eV',300.0,'intrinsic, indirect','NSM Archive — https://www.ioffe.ru/SVA/NSM/Semicond/SiC' FROM materials WHERE name='Silicon Carbide (4H-SiC)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'carrier_mobility','electrical',1000.0,'(+/-100 cm^2/Vs)','cm^2 V^-1 s^-1',300.0,'bulk n-type (N-doped)','NSM Archive' FROM materials WHERE name='Silicon Carbide (4H-SiC)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',370.0,'(+/-20 W/mK)','W m^-1 K^-1',300.0,'bulk','NSM Archive' FROM materials WHERE name='Silicon Carbide (4H-SiC)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',450.0,'(+/-10 GPa)','GPa',298.15,'bulk','NSM Archive / Materials Project' FROM materials WHERE name='Silicon Carbide (4H-SiC)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'refractive_index','optical',2.55,'(+/-0.02 at 500 nm)','dimensionless',300.0,'at 500 nm, ordinary ray','refractiveindex.info' FROM materials WHERE name='Silicon Carbide (4H-SiC)';
-- ═══════════════════════════════════════════════════════════════════════════
-- CERAMICS
-- ═══════════════════════════════════════════════════════════════════════════
-- ── Alumina (Al2O3) ─────────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',380.0,'(+/-10 GPa)','GPa',298.15,'dense polycrystalline','NIST WebBook / Materials Project' FROM materials WHERE name='Alumina (Al2O3)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'hardness_vickers','mechanical',1800.0,'(+/-100 HV)','HV',298.15,'dense','NIST / Materials Project' FROM materials WHERE name='Alumina (Al2O3)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'fracture_toughness','mechanical',3.5,'(+/-0.5 MPa sqrt(m))','MPa m^0.5',298.15,'dense polycrystalline','NIST / Materials Project' FROM materials WHERE name='Alumina (Al2O3)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',1.0e13,'(order of magnitude)','Ohm m',298.15,'dense, dry','NIST WebBook' FROM materials WHERE name='Alumina (Al2O3)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',30.0,'(+/-2 W/mK)','W m^-1 K^-1',298.15,'dense polycrystalline','NIST WebBook' FROM materials WHERE name='Alumina (Al2O3)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'specific_heat_capacity','thermal',775.0,'(+/-10 J/kgK)','J kg^-1 K^-1',298.15,'dense','NIST WebBook' FROM materials WHERE name='Alumina (Al2O3)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'melting_point','thermal',2327.0,'(+/-5 K)','K',NULL,'1 atm','NIST WebBook SRD 69' FROM materials WHERE name='Alumina (Al2O3)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'refractive_index','optical',1.765,'(+/-0.002 at 589 nm)','dimensionless',298.15,'ordinary ray, sapphire single crystal, 589 nm','refractiveindex.info — https://refractiveindex.info/?shelf=main&book=Al2O3&page=Malitson' FROM materials WHERE name='Alumina (Al2O3)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'relative_permeability','magnetic',1.0000,'(exact, diamagnetic)','dimensionless',298.15,'dense','NIST' FROM materials WHERE name='Alumina (Al2O3)';
-- ── Silicon Nitride (Si3N4) ──────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',310.0,'(+/-10 GPa)','GPa',298.15,'hot-pressed dense','NIST WebBook / OQMD' FROM materials WHERE name='Silicon Nitride (Si3N4)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'fracture_toughness','mechanical',6.5,'(+/-0.5 MPa sqrt(m))','MPa m^0.5',298.15,'hot-pressed','NIST / OQMD' FROM materials WHERE name='Silicon Nitride (Si3N4)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'hardness_vickers','mechanical',1600.0,'(+/-100 HV)','HV',298.15,'dense','NIST' FROM materials WHERE name='Silicon Nitride (Si3N4)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',30.0,'(+/-3 W/mK)','W m^-1 K^-1',298.15,'dense','NIST WebBook' FROM materials WHERE name='Silicon Nitride (Si3N4)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',1.0e12,'(order of magnitude)','Ohm m',298.15,'dense','NIST WebBook' FROM materials WHERE name='Silicon Nitride (Si3N4)';
-- ── Barium Titanate (BaTiO3) ─────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'relative_permeability','magnetic',1.0000,'(exact, weakly diamagnetic)','dimensionless',298.15,'dense','Materials Project' FROM materials WHERE name='Barium Titanate (BaTiO3)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'curie_temperature','thermal',393.0,'(+/-2 K)','K',NULL,'ferroelectric-paraelectric transition','Materials Project — https://materialsproject.org/materials/mp-5020' FROM materials WHERE name='Barium Titanate (BaTiO3)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'refractive_index','optical',2.416,'(+/-0.005 at 589 nm, ordinary ray)','dimensionless',298.15,'tetragonal, 589 nm','refractiveindex.info' FROM materials WHERE name='Barium Titanate (BaTiO3)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',120.0,'(+/-5 GPa)','GPa',298.15,'dense polycrystalline','Materials Project' FROM materials WHERE name='Barium Titanate (BaTiO3)';
-- ── Tungsten Carbide (WC) ────────────────────────────────────────────────────
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'elastic_modulus','mechanical',696.0,'(+/-10 GPa)','GPa',298.15,'dense sintered','NIST / AFLOW' FROM materials WHERE name='Tungsten Carbide (WC)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'hardness_vickers','mechanical',2200.0,'(+/-200 HV)','HV',298.15,'dense sintered','NIST / AFLOW' FROM materials WHERE name='Tungsten Carbide (WC)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'fracture_toughness','mechanical',6.0,'(+/-1 MPa sqrt(m))','MPa m^0.5',298.15,'monolithic WC','NIST / AFLOW' FROM materials WHERE name='Tungsten Carbide (WC)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'electrical_resistivity','electrical',5.0e-7,'(u_r=10%)','Ohm m',298.15,'dense sintered','NIST / AFLOW' FROM materials WHERE name='Tungsten Carbide (WC)';
INSERT OR IGNORE INTO material_properties (material_id, property_name, property_category, value, uncertainty_codata, unit, temperature_k, condition, source)
  SELECT id,'thermal_conductivity','thermal',63.0,'(+/-3 W/mK)','W m^-1 K^-1',298.15,'dense sintered','NIST / AFLOW' FROM materials WHERE name='Tungsten Carbide (WC)';
