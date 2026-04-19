-- Materials catalog
-- Sources: AFLOW (http://aflow.org, CC-BY-4.0), OQMD (http://oqmd.org, MIT),
--          Materials Project (https://materialsproject.org, CC-BY-4.0),
--          NIST WebBook SRD 69 (https://webbook.nist.gov, public domain),
--          NSM Semiconductor Archive (https://www.ioffe.ru/SVA/NSM/Semicond/, free academic)
-- ─── PURE METALS ────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Aluminum (pure)', 'Al', 'metal', 'light metal', 'FCC', 'experimental', 'NIST WebBook / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Copper (pure)', 'Cu', 'metal', 'noble metal', 'FCC', 'experimental', 'NIST WebBook / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Iron (pure)', 'Fe', 'metal', 'ferrous metal', 'BCC (alpha)', 'experimental', 'NIST WebBook / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Nickel (pure)', 'Ni', 'metal', 'transition metal', 'FCC', 'experimental', 'NIST WebBook / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Titanium (pure)', 'Ti', 'metal', 'light metal', 'HCP (alpha)', 'experimental', 'NIST WebBook / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Tungsten (pure)', 'W', 'metal', 'refractory metal', 'BCC', 'experimental', 'NIST WebBook / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Gold (pure)', 'Au', 'metal', 'noble metal', 'FCC', 'experimental', 'NIST WebBook / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Silver (pure)', 'Ag', 'metal', 'noble metal', 'FCC', 'experimental', 'NIST WebBook / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Magnesium (pure)', 'Mg', 'metal', 'light metal', 'HCP', 'experimental', 'NIST WebBook / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Cobalt (pure)', 'Co', 'metal', 'transition metal', 'HCP (alpha)', 'experimental', 'NIST WebBook / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Molybdenum (pure)', 'Mo', 'metal', 'refractory metal', 'BCC', 'experimental', 'NIST WebBook / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Chromium (pure)', 'Cr', 'metal', 'transition metal', 'BCC', 'experimental', 'NIST WebBook / AFLOW');
-- ─── ALLOYS ─────────────────────────────────────────────────────────────────
-- Aluminum alloys
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Aluminum 2024-T3', 'Al-4.4Cu-1.5Mg-0.6Mn', 'alloy', 'aluminum alloy', 'FCC', 'experimental', 'NIST / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Aluminum 6061-T6', 'Al-1Mg-0.6Si-0.28Cu-0.2Cr', 'alloy', 'aluminum alloy', 'FCC', 'experimental', 'NIST / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Aluminum 7075-T6', 'Al-5.6Zn-2.5Mg-1.6Cu-0.23Cr', 'alloy', 'aluminum alloy', 'FCC', 'experimental', 'NIST / AFLOW');
-- Titanium alloys
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Ti-6Al-4V (Grade 5)', 'Ti-6Al-4V', 'alloy', 'titanium alloy', 'alpha-beta HCP/BCC', 'experimental', 'NIST / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Ti-6Al-2Sn-4Zr-2Mo', 'Ti-6Al-2Sn-4Zr-2Mo', 'alloy', 'titanium alloy', 'alpha-beta', 'experimental', 'NIST / OQMD');
-- Stainless steels
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('304 Stainless Steel', 'Fe-18Cr-8Ni', 'alloy', 'austenitic stainless steel', 'FCC', 'experimental', 'NIST WebBook');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('316L Stainless Steel', 'Fe-17Cr-12Ni-2.5Mo', 'alloy', 'austenitic stainless steel', 'FCC', 'experimental', 'NIST WebBook');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('17-4 PH Stainless Steel', 'Fe-17Cr-4Ni-4Cu-0.3Nb', 'alloy', 'martensitic stainless steel', 'BCT', 'experimental', 'NIST / AFLOW');
-- Carbon steels
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('AISI 1020 Carbon Steel', 'Fe-0.2C', 'alloy', 'carbon steel', 'BCC', 'experimental', 'NIST WebBook');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('AISI 4340 Alloy Steel', 'Fe-0.4C-1.8Ni-0.8Cr-0.25Mo', 'alloy', 'alloy steel', 'BCC', 'experimental', 'NIST WebBook');
-- Nickel superalloys
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Inconel 625', 'Ni-21.5Cr-9Mo-3.65Nb', 'alloy', 'nickel superalloy', 'FCC', 'experimental', 'NIST / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Inconel 718', 'Ni-19Cr-18.5Fe-5.1Nb-3Mo-0.9Ti-0.5Al', 'alloy', 'nickel superalloy', 'FCC+gamma_prime', 'experimental', 'NIST / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Waspaloy', 'Ni-19.5Cr-13.5Co-4.3Mo-3Ti-1.4Al', 'alloy', 'nickel superalloy', 'FCC+gamma_prime', 'experimental', 'NIST / OQMD');
-- Copper alloys
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Brass (C26000)', 'Cu-30Zn', 'alloy', 'copper alloy', 'FCC', 'experimental', 'NIST WebBook');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Bronze (C91300)', 'Cu-11Sn-1Ni', 'alloy', 'copper alloy', 'FCC', 'experimental', 'NIST WebBook');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Beryllium Copper (C17200)', 'Cu-1.9Be-0.2Co', 'alloy', 'copper alloy', 'FCC', 'experimental', 'NIST / AFLOW');
-- Cobalt alloys
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Stellite 6', 'Co-28Cr-4.5W-1.2C', 'alloy', 'cobalt alloy', 'FCC/HCP', 'experimental', 'NIST / OQMD');
-- Refractory alloys
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Haynes 230', 'Ni-22Cr-14W-2Mo-0.3Al', 'alloy', 'nickel superalloy', 'FCC', 'experimental', 'NIST / AFLOW');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Mo-TZM Alloy', 'Mo-0.5Ti-0.08Zr-0.02C', 'alloy', 'refractory alloy', 'BCC', 'experimental', 'NIST / OQMD');
-- Shape memory / special alloys
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Nitinol (NiTi)', 'Ni-50Ti (at%)', 'alloy', 'shape memory alloy', 'B2/B19-martensite', 'experimental', 'NIST / Materials Project');
-- ─── SEMICONDUCTORS ─────────────────────────────────────────────────────────
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Silicon', 'Si', 'semiconductor', 'group-IV semiconductor', 'diamond cubic', 'experimental', 'NSM Archive / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Germanium', 'Ge', 'semiconductor', 'group-IV semiconductor', 'diamond cubic', 'experimental', 'NSM Archive / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Gallium Arsenide (GaAs)', 'GaAs', 'semiconductor', 'III-V semiconductor', 'zinc blende', 'experimental', 'NSM Archive / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Indium Phosphide (InP)', 'InP', 'semiconductor', 'III-V semiconductor', 'zinc blende', 'experimental', 'NSM Archive / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Gallium Nitride (GaN)', 'GaN', 'semiconductor', 'III-nitride semiconductor', 'wurtzite', 'experimental', 'NSM Archive / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Silicon Carbide (4H-SiC)', '4H-SiC', 'semiconductor', 'wide bandgap semiconductor', '4H wurtzite', 'experimental', 'NSM Archive / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Silicon Carbide (3C-SiC)', '3C-SiC', 'semiconductor', 'wide bandgap semiconductor', 'zinc blende', 'experimental', 'NSM Archive / OQMD');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Gallium Phosphide (GaP)', 'GaP', 'semiconductor', 'III-V semiconductor', 'zinc blende', 'experimental', 'NSM Archive / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Indium Arsenide (InAs)', 'InAs', 'semiconductor', 'III-V semiconductor', 'zinc blende', 'experimental', 'NSM Archive / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Cadmium Telluride (CdTe)', 'CdTe', 'semiconductor', 'II-VI semiconductor', 'zinc blende', 'experimental', 'NSM Archive / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Zinc Oxide (ZnO)', 'ZnO', 'semiconductor', 'II-VI wide bandgap', 'wurtzite', 'experimental', 'NSM Archive / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Diamond (semiconductor)', 'C', 'semiconductor', 'ultra-wide bandgap', 'diamond cubic', 'experimental', 'NSM Archive / Materials Project');
-- ─── CERAMICS ───────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Alumina (Al2O3)', 'Al2O3', 'ceramic', 'oxide ceramic', 'rhombohedral (corundum)', 'experimental', 'NIST WebBook / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Zirconia (ZrO2, stabilized)', '8YSZ — ZrO2-8mol%Y2O3', 'ceramic', 'oxide ceramic (TBC)', 'cubic/tetragonal', 'experimental', 'NIST / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Silicon Nitride (Si3N4)', 'Si3N4', 'ceramic', 'nitride ceramic', 'alpha/beta hexagonal', 'experimental', 'NIST WebBook / OQMD');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Silicon Carbide (SiC, ceramic)', 'SiC', 'ceramic', 'carbide ceramic', 'alpha-6H hexagonal', 'experimental', 'NIST WebBook / OQMD');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Boron Carbide (B4C)', 'B4C', 'ceramic', 'carbide ceramic', 'rhombohedral', 'experimental', 'NIST / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Titanium Diboride (TiB2)', 'TiB2', 'ceramic', 'boride ceramic', 'hexagonal (AlB2-type)', 'experimental', 'NIST / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Magnesia (MgO)', 'MgO', 'ceramic', 'oxide ceramic', 'rock salt (FCC)', 'experimental', 'NIST WebBook / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Barium Titanate (BaTiO3)', 'BaTiO3', 'ceramic', 'ferroelectric ceramic', 'perovskite', 'experimental', 'Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Hydroxyapatite (HA)', 'Ca10(PO4)6(OH)2', 'ceramic', 'biomedical ceramic', 'hexagonal', 'experimental', 'NIST / Materials Project');
INSERT OR IGNORE INTO materials (name, composition, category, sub_category, crystal_structure, data_type, source_db) VALUES
  ('Tungsten Carbide (WC)', 'WC', 'ceramic', 'carbide ceramic', 'hexagonal', 'experimental', 'NIST / AFLOW');
