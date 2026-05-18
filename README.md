# atomic-context

> **Read-only MCP server** for exact, citable values of fundamental physical constants,
> particle properties, and material properties — powered by Java Spring Boot + SQLite.

## Why this exists

LLMs know physics. Their weights do **not** reliably reproduce the exact 12-decimal-place CODATA
constants or the specific heat capacity of an obscure alloy at a non-standard temperature.
`atomic-context` is a grounding layer: a deterministic, citable, offline knowledge server that
any MCP-compatible client (Claude Desktop, Cursor, Continue.dev …) can call.

---

## Data sources (open-source only)

| Dataset | Coverage | License | URL |
|---|---|---|---|
| NIST CODATA 2022 (SRD 121) | 29 fundamental constants | U.S. Gov. Work (public domain) | https://physics.nist.gov/cuu/Constants/ |
| PDG 2024 | 20 particles (leptons, baryons, bosons, quarks, mesons) | CC-BY-4.0 | https://pdg.lbl.gov |
| NIST WebBook SRD 69 | Thermophysical & mechanical properties | U.S. Gov. Work (public domain) | https://webbook.nist.gov |
| AFLOW (aflow.org) | Metals, alloys, intermetallics | CC-BY-4.0 | http://aflow.org |
| OQMD | Metals, alloys, ceramics (DFT) | MIT | http://oqmd.org |
| Materials Project | Semiconductors, ceramics (DFT + exp) | CC-BY-4.0 | https://materialsproject.org |
| NSM Semiconductor Archive | Semiconductors (exp.) | Free academic | https://www.ioffe.ru/SVA/NSM/Semicond/ |
| refractiveindex.info | Optical (refractive index, absorption) | CC0 | https://refractiveindex.info |

---

## MCP Tools

| Tool | Description |
|---|---|
| `get_constant` | Exact CODATA 2022 value for a physical constant by symbol or name |
| `search_constants` | Search constants by keyword or category |
| `list_constant_categories` | List all constant categories |
| `get_particle` | PDG 2024 properties (mass, spin, charge, lifetime) for a particle |
| `search_particles` | Search particles by name, symbol, or type |
| `get_material_property` | Specific property for a material at a given temperature |
| `search_materials` | Search materials by name, composition, or category |
| `list_material_properties` | All available properties for a material |
| `get_material_properties_by_category` | All properties of one category (mechanical/electrical/thermal/optical/magnetic) |

### Material categories

- **metal** — pure metals (Al, Cu, Fe, Ni, Ti, W, Au, Ag, Mg, Co, Mo, Cr)
- **alloy** — Al alloys (2024/6061/7075), Ti alloys (Ti-6Al-4V, Ti-6242), stainless steels (304, 316L, 17-4PH), carbon steels (1020, 4340), Ni superalloys (Inconel 625/718, Waspaloy, Haynes 230), Cu alloys (brass, bronze, BeCu), Co alloys (Stellite 6), refractory alloys (Mo-TZM), shape memory (NiTi)
- **semiconductor** — Si, Ge, GaAs, InP, GaN, 4H-SiC, 3C-SiC, GaP, InAs, CdTe, ZnO, Diamond
- **ceramic** — Al₂O₃, ZrO₂ (8YSZ), Si₃N₄, SiC, B₄C, TiB₂, MgO, BaTiO₃, HA, WC

### Property categories

| Category | Properties |
|---|---|
| `mechanical` | elastic_modulus, tensile_strength_ultimate, yield_strength, hardness_vickers, fracture_toughness, elongation_at_break |
| `electrical` | electrical_resistivity, carrier_mobility, bandgap, conductivity |
| `thermal` | thermal_conductivity, specific_heat_capacity, melting_point, thermal_expansion_coefficient, curie_temperature |
| `optical` | refractive_index, absorption_coefficient, optical_bandgap |
| `magnetic` | saturation_magnetization, coercivity, relative_permeability, curie_temperature |

---

## Build & run

### Requirements

- Java 21
- Maven 3.6+

### Build

```bash
cd atomic-context
mvn clean package -DskipTests
```

---

## Transport modes

The server supports two transport modes, selected via a Spring profile.
The `@Tool` methods are identical in both modes — only the transport layer changes.

### stdio — Claude Desktop (local)

Communicates over stdin/stdout. All logging is silenced to keep the pipe clean.

```bash
java -jar target/atomic-context-1.0.0.jar --spring.profiles.active=stdio
```

**Claude Desktop configuration**

Add to `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS)
or `%APPDATA%\Claude\claude_desktop_config.json` (Windows):

```json
{
  "mcpServers": {
    "atomic-context": {
      "command": "java",
      "args": [
        "-jar",
        "/absolute/path/to/atomic-context-1.0.0.jar",
        "--spring.profiles.active=stdio"
      ]
    }
  }
}
```

---

### SSE/HTTP — networked clients (default)

Exposes the MCP server over HTTP using Server-Sent Events.
This is the default profile when no `--spring.profiles.active` flag is provided.

```bash
# Default (sse profile)
java -jar target/atomic-context-1.0.0.jar

# Explicit
java -jar target/atomic-context-1.0.0.jar --spring.profiles.active=sse
```

| Endpoint | URL |
|---|---|
| SSE stream | `http://localhost:8080/sse/atomic-context` |
| MCP messages | `http://localhost:8080/mcp/message` |

**MCP client configuration**

```json
{
  "mcpServers": {
    "atomic-context": {
      "url": "http://localhost:8080/sse/atomic-context"
    }
  }
}
```

**Production deployment**

The port and SSE path can be overridden at runtime without any code changes:

```bash
java -jar atomic-context-1.0.0.jar \
  --spring.profiles.active=sse \
  --server.port=9090 \
  --spring.ai.mcp.server.sse-endpoint=/sse/atomic-context
```

Or via environment variables (Spring Boot maps them automatically):

```bash
export SERVER_PORT=9090
export SPRING_AI_MCP_SERVER_SSE_ENDPOINT=/sse/atomic-context
java -jar atomic-context-1.0.0.jar --spring.profiles.active=sse
```

For HTTPS in production, place a reverse proxy (Nginx, Caddy) in front and proxy to the local port.
Critical Nginx settings for SSE:

```nginx
location /sse/atomic-context {
    proxy_pass         http://127.0.0.1:8080/sse/atomic-context;
    proxy_http_version 1.1;
    proxy_set_header   Connection "";
    proxy_buffering    off;
    proxy_cache        off;
    proxy_read_timeout 24h;
}
```

---

## Configuration files

| File | Purpose |
|---|---|
| `application.properties` | Shared config: MCP metadata, SQLite datasource, JPA, logging |
| `application-sse.properties` | SSE transport settings (port, endpoint path) |
| `application-stdio.properties` | stdio transport + full logging blackout |

---

## Database location

The SQLite database is stored at `~/.atomic-context/atomic-context.db` and is seeded
automatically on first startup. The seed scripts in `src/main/resources/db/seed/` are
idempotent (`INSERT OR IGNORE`) and safe to re-run.

---

## License

[MIT](LICENSE) — data is attributed per-row to original open-source sources.
