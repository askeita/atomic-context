-- CODATA 2022 Fundamental Physical Constants
-- Source: NIST SRD 121 — https://physics.nist.gov/cuu/Constants/
-- DOI: https://doi.org/10.18434/T4WW24
-- License: U.S. Government Work (public domain)
-- ─── UNIVERSAL ──────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('c',    'speed of light in vacuum',
   '299 792 458 (exact)',
   299792458.0, 'm s^-1', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'universal');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('h',    'Planck constant',
   '6.626 070 15 × 10^-34 (exact)',
   6.62607015e-34, 'J Hz^-1', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'universal');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('hbar', 'reduced Planck constant',
   '1.054 571 817 × 10^-34 (exact)',
   1.054571817e-34, 'J s', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'universal');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('G',    'Newtonian constant of gravitation',
   '6.674 30 × 10^-11 (u_r = 2.2 × 10^-5)',
   6.67430e-11, 'm^3 kg^-1 s^-2', 'u_r = 2.2 × 10^-5',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'universal');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('mu_0', 'vacuum magnetic permeability',
   '1.256 637 061 27 × 10^-6 (u_r = 1.6 × 10^-10)',
   1.25663706127e-6, 'N A^-2', 'u_r = 1.6 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'universal');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('eps_0','vacuum electric permittivity',
   '8.854 187 8188 × 10^-12 (u_r = 1.6 × 10^-10)',
   8.8541878188e-12, 'F m^-1', 'u_r = 1.6 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'universal');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('Z_0',  'characteristic impedance of vacuum',
   '376.730 313 412 (u_r = 1.6 × 10^-10)',
   376.730313412, 'Ohm', 'u_r = 1.6 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'universal');
-- ─── ELECTROMAGNETIC ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('e',    'elementary charge',
   '1.602 176 634 × 10^-19 (exact)',
   1.602176634e-19, 'C', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'electromagnetic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('Phi_0','magnetic flux quantum',
   '2.067 833 848 × 10^-15 (exact)',
   2.067833848e-15, 'Wb', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'electromagnetic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('K_J',  'Josephson constant',
   '483 597.848 4 × 10^9 (exact)',
   4.835978484e14, 'Hz V^-1', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'electromagnetic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('R_K',  'von Klitzing constant',
   '25 812.807 45 (exact)',
   25812.80745, 'Ohm', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'electromagnetic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('mu_B', 'Bohr magneton',
   '9.274 010 0783 × 10^-24 (u_r = 3.0 × 10^-10)',
   9.2740100783e-24, 'J T^-1', 'u_r = 3.0 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'electromagnetic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('mu_N', 'nuclear magneton',
   '5.050 783 7461 × 10^-27 (u_r = 3.1 × 10^-10)',
   5.0507837461e-27, 'J T^-1', 'u_r = 3.1 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'electromagnetic');
-- ─── ATOMIC & NUCLEAR ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('alpha','fine-structure constant',
   '7.297 352 5643 × 10^-3 (u_r = 1.6 × 10^-10)',
   7.2973525643e-3, '', 'u_r = 1.6 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'atomic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('R_inf','Rydberg constant',
   '10 973 731.568 157 (u_r = 1.9 × 10^-12)',
   10973731.568157, 'm^-1', 'u_r = 1.9 × 10^-12',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'atomic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('a_0',  'Bohr radius',
   '5.291 772 105 44 × 10^-11 (u_r = 1.6 × 10^-10)',
   5.29177210544e-11, 'm', 'u_r = 1.6 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'atomic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('m_e',  'electron mass',
   '9.109 383 7139 × 10^-31 (u_r = 3.1 × 10^-10)',
   9.1093837139e-31, 'kg', 'u_r = 3.1 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'atomic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('m_p',  'proton mass',
   '1.672 621 925 95 × 10^-27 (u_r = 3.1 × 10^-10)',
   1.67262192595e-27, 'kg', 'u_r = 3.1 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'atomic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('m_n',  'neutron mass',
   '1.674 927 500 56 × 10^-27 (u_r = 3.1 × 10^-10)',
   1.67492750056e-27, 'kg', 'u_r = 3.1 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'atomic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('m_u',  'atomic mass unit (dalton)',
   '1.660 539 068 92 × 10^-27 (u_r = 3.0 × 10^-10)',
   1.66053906892e-27, 'kg', 'u_r = 3.0 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'atomic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('r_e',  'classical electron radius',
   '2.817 940 3205 × 10^-15 (u_r = 4.7 × 10^-10)',
   2.8179403205e-15, 'm', 'u_r = 4.7 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'atomic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('sigma_e','Thomson cross section',
   '6.652 458 7051 × 10^-29 (u_r = 9.4 × 10^-10)',
   6.6524587051e-29, 'm^2', 'u_r = 9.4 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'atomic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('g_e',  'electron g-factor',
   '-2.002 319 304 360 92 (u_r = 1.7 × 10^-13)',
   -2.00231930436092, '', 'u_r = 1.7 × 10^-13',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'atomic');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('E_h',  'Hartree energy',
   '4.359 744 650 54 × 10^-18 (u_r = 1.6 × 10^-10)',
   4.35974465054e-18, 'J', 'u_r = 1.6 × 10^-10',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'atomic');
-- ─── PHYSICO-CHEMICAL ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('N_A',  'Avogadro constant',
   '6.022 140 76 × 10^23 (exact)',
   6.02214076e23, 'mol^-1', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'physico-chemical');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('k_B',  'Boltzmann constant',
   '1.380 649 × 10^-23 (exact)',
   1.380649e-23, 'J K^-1', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'physico-chemical');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('R',    'molar gas constant',
   '8.314 462 618 (exact)',
   8.314462618, 'J mol^-1 K^-1', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'physico-chemical');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('F',    'Faraday constant',
   '96 485.332 12 (exact)',
   96485.33212, 'C mol^-1', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'physico-chemical');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('sigma','Stefan-Boltzmann constant',
   '5.670 374 419 × 10^-8 (exact)',
   5.670374419e-8, 'W m^-2 K^-4', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'physico-chemical');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('b',    'Wien wavelength displacement law constant',
   '2.897 771 955 × 10^-3 (exact)',
   2.897771955e-3, 'm K', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'physico-chemical');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('c_1',  'first radiation constant',
   '3.741 771 852 × 10^-16 (exact)',
   3.741771852e-16, 'W m^2', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'physico-chemical');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('c_2',  'second radiation constant',
   '1.438 776 877 × 10^-2 (exact)',
   1.438776877e-2, 'm K', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'physico-chemical');
INSERT OR IGNORE INTO physical_constants
  (symbol, name, value_codata, value_numeric, unit, uncertainty, source, codata_year, category) VALUES
  ('V_m',  'molar volume of ideal gas at STP (273.15 K, 100 kPa)',
   '22.710 954 64 × 10^-3 (exact)',
   22.71095464e-3, 'm^3 mol^-1', '0 (exact)',
   'NIST CODATA 2022 — https://doi.org/10.18434/T4WW24', 2022, 'physico-chemical');
