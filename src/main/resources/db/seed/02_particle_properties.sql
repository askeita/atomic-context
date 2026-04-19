-- PDG 2024 Particle Properties
-- Source: Particle Data Group — https://pdg.lbl.gov
-- Review of Particle Physics, S. Navas et al. (Particle Data Group), Phys. Rev. D 110, 030001 (2024)
-- License: Open Data / CC-BY-4.0
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('electron', 'e^-', 'lepton',
   '9.109 383 7139 x 10^-31 kg (u_r = 3.1 x 10^-10)',
   9.1093837139e-31, '1/2',
   '-1.602 176 634 x 10^-19 C (exact)', '-1',
   'stable',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('muon', 'mu^-', 'lepton',
   '1.883 531 627 x 10^-28 kg (± 4.2 x 10^-37 kg)',
   1.883531627e-28, '1/2',
   '-1.602 176 634 x 10^-19 C (exact)', '-1',
   '2.196 811 x 10^-6 s (± 0.000 022 x 10^-6 s)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('tau lepton', 'tau^-', 'lepton',
   '3.167 54 x 10^-27 kg (± 2.1 x 10^-31 kg)',
   3.16754e-27, '1/2',
   '-1.602 176 634 x 10^-19 C (exact)', '-1',
   '2.903 x 10^-13 s (± 0.005 x 10^-13 s)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('electron neutrino', 'nu_e', 'lepton',
   '< 2.14 x 10^-36 kg (at 90% CL, Katrin 2022)',
   NULL, '1/2',
   '0 (exact)', '0',
   'stable',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('proton', 'p', 'baryon',
   '1.672 621 925 95 x 10^-27 kg (u_r = 3.1 x 10^-10)',
   1.67262192595e-27, '1/2',
   '+1.602 176 634 x 10^-19 C (exact)', '+1',
   'stable (> 3.6 x 10^29 yr at 90% CL)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('neutron', 'n', 'baryon',
   '1.674 927 500 56 x 10^-27 kg (u_r = 3.1 x 10^-10)',
   1.67492750056e-27, '1/2',
   '0 (exact)', '0',
   '879.4 s (± 0.6 s)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('photon', 'gamma', 'boson',
   '0 (exact, < 10^-54 kg experimentally)',
   0.0, '1',
   '0 (exact)', '0',
   'stable',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('W boson', 'W^±', 'boson',
   '1.433 2 x 10^-25 kg (± 3.0 x 10^-29 kg)',
   1.4332e-25, '1',
   '±1.602 176 634 x 10^-19 C (exact)', '±1',
   '3.157 x 10^-25 s (from width)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('Z boson', 'Z^0', 'boson',
   '1.625 6 x 10^-25 kg (± 5.8 x 10^-30 kg)',
   1.6256e-25, '1',
   '0 (exact)', '0',
   '2.638 x 10^-25 s (from width)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('Higgs boson', 'H^0', 'boson',
   '2.233 x 10^-25 kg (± 3.5 x 10^-28 kg)',
   2.233e-25, '0',
   '0 (exact)', '0',
   '1.6 x 10^-22 s (from width)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('gluon', 'g', 'boson',
   '0 (theoretical; confined)',
   0.0, '1',
   '0 (exact)', '0',
   'stable (confined)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('up quark', 'u', 'quark',
   '~3.7 x 10^-30 kg (MSbar: 2.16 +0.49/-0.26 MeV/c^2)',
   3.7e-30, '1/2',
   'N/A (confined)', '+2/3',
   'stable (confined)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('down quark', 'd', 'quark',
   '~8.5 x 10^-30 kg (MSbar: 4.67 +0.48/-0.17 MeV/c^2)',
   8.5e-30, '1/2',
   'N/A (confined)', '-1/3',
   'stable (confined)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('strange quark', 's', 'quark',
   '~1.64 x 10^-28 kg (MSbar: 93.4 +8.6/-3.4 MeV/c^2)',
   1.64e-28, '1/2',
   'N/A (confined)', '-1/3',
   'stable (confined)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('charm quark', 'c', 'quark',
   '~2.27 x 10^-27 kg (MSbar: 1273 ± 46 MeV/c^2)',
   2.27e-27, '1/2',
   'N/A (confined)', '+2/3',
   'stable (confined)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('bottom quark', 'b', 'quark',
   '~7.42 x 10^-27 kg (MSbar: 4183 +17/-18 MeV/c^2)',
   7.42e-27, '1/2',
   'N/A (confined)', '-1/3',
   'stable (confined)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('top quark', 't', 'quark',
   '~3.08 x 10^-25 kg (172.57 ± 0.29 GeV/c^2)',
   3.08e-25, '1/2',
   'N/A (decays before confinement)', '+2/3',
   '~5 x 10^-25 s (from width)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('pion (charged)', 'pi^±', 'meson',
   '2.488 x 10^-28 kg (139.570 39 ± 0.000 18 MeV/c^2)',
   2.488e-28, '0',
   '±1.602 176 634 x 10^-19 C (exact)', '±1',
   '2.6033 x 10^-8 s (± 0.0005 x 10^-8 s)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('pion (neutral)', 'pi^0', 'meson',
   '2.406 x 10^-28 kg (134.976 6 ± 0.000 6 MeV/c^2)',
   2.406e-28, '0',
   '0 (exact)', '0',
   '8.52 x 10^-17 s (± 0.18 x 10^-17 s)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
INSERT OR IGNORE INTO particle_properties
  (name, symbol, particle_type, mass_codata, mass_kg, spin, charge_codata, charge_e, lifetime, source, pdg_year) VALUES
  ('kaon (charged)', 'K^±', 'meson',
   '8.802 x 10^-28 kg (493.677 ± 0.013 MeV/c^2)',
   8.802e-28, '0',
   '±1.602 176 634 x 10^-19 C (exact)', '±1',
   '1.2380 x 10^-8 s (± 0.0021 x 10^-8 s)',
   'PDG 2024, Phys. Rev. D 110, 030001 — https://pdg.lbl.gov', 2024);
