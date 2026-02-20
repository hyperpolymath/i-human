<!-- SPDX-License-Identifier: PMPL-1.0-or-later -->
<!-- TOPOLOGY.md — Project architecture map and completion dashboard -->
<!-- Last updated: 2026-02-20 -->

# I, Human (Project Veracity) — Project Topology

## System Architecture

```
                    ┌──────────────────────────────────┐
                    │          USER BROWSER             │
                    │  ┌────────────┐  ┌────────────┐  │
                    │  │ ReScript   │  │ Svelte UI  │  │
                    │  │ Fingerprint│  │ Audit Page │  │
                    │  │ Collector  │  │ + Results  │  │
                    │  └──────┬─────┘  └──────┬─────┘  │
                    └─────────│───────────────│─────────┘
                              │   POST /api/audit
                              ▼               │
                    ┌─────────────────────────▼─────────┐
                    │     PHOENIX / BANDIT (Elixir)      │
                    │                                    │
                    │  ┌──────────┐  ┌───────────────┐  │
                    │  │ Audit    │  │ Nickel Rules  │  │
                    │  │Controller│  │ Engine        │  │
                    │  └────┬─────┘  └───────┬───────┘  │
                    │       │                │           │
                    │  ┌────▼────┐   ┌───────▼───────┐  │
                    │  │ IP      │   │ Score         │  │
                    │  │ Analyzer│   │ Composer      │  │
                    │  └────┬────┘   └───────────────┘  │
                    │       │                            │
                    │  ┌────▼────────────────────────┐   │
                    │  │  LMDB Cache (embedded)      │   │
                    │  └────┬───────────────────────-┘   │
                    └───────│────────────────────────────┘
                            │
               ┌────────────┼────────────────┐
               ▼            ▼                ▼
        ┌──────────┐ ┌──────────┐  ┌────────────────┐
        │ ip-api   │ │AbuseIPDB │  │   ArangoDB     │
        │ GeoIP    │ │Reputation│  │ (Document+Graph)│
        └──────────┘ └──────────┘  └────────────────┘
```

## Completion Dashboard

```
COMPONENT                          STATUS              NOTES
─────────────────────────────────  ──────────────────  ─────────────────────────────────
BACKEND (Elixir/Phoenix)
  Phoenix project setup            ░░░░░░░░░░   0%    Bandit server, no Ecto
  IP/ASN/Geo analysis module       ░░░░░░░░░░   0%    ip-api.com + AbuseIPDB
  Scoring engine                   ░░░░░░░░░░   0%    Weighted risk composition
  Nickel rules integration         ░░░░░░░░░░   0%    audit_rules.ncl
  ArangoDB persistence             ░░░░░░░░░░   0%    Document + Graph model
  LMDB caching layer               ░░░░░░░░░░   0%    Embedded KV with TTL

FRONTEND (SvelteKit + ReScript)
  SvelteKit project setup          ░░░░░░░░░░   0%    Deno runtime
  ReScript fingerprint module      ░░░░░░░░░░   0%    UA, webdriver, canvas, cookies
  Mouse entropy capture            ░░░░░░░░░░   0%    Behavioral heuristic
  Audit UI + risk visualization    ░░░░░░░░░░   0%    Score gauge + breakdown

INFRASTRUCTURE
  RSR template scaffolding         ██████████ 100%    Template applied
  AI Gatekeeper (0-AI-MANIFEST)    ██████████ 100%    Manifest customized
  6SCM Metadata                    ██████████ 100%    STATE/META/ECOSYSTEM updated
  Containerfile (Podman)           ░░░░░░░░░░   0%    Chainguard base images
  CI/CD Workflows                  ░░░░░░░░░░   0%    Standard 17 workflows

ABI/FFI (Idris2/Zig)
  Idris2 ABI definitions           ░░░░░░░░░░   0%    Trust score types
  Zig FFI implementation           ░░░░░░░░░░   0%    C-compatible bridge

─────────────────────────────────────────────────────────────────────────────
OVERALL:                           ██░░░░░░░░  10%    Template scaffolded, code TBD
```

## Key Dependencies

```
Client Signals ──► Phoenix API ──► Score Engine ──► ArangoDB (persist)
      │                │               │
      ▼                ▼               ▼
ReScript/Svelte   IP Services     Nickel Rules
(browser APIs)   (ip-api, AIPDB)  (weights, ASNs)
                       │
                       ▼
                  LMDB Cache
                (fast lookups)
```

## Update Protocol

This file is maintained by both humans and AI agents. When updating:

1. **After completing a component**: Change its bar and percentage
2. **After adding a component**: Add a new row in the appropriate section
3. **After architectural changes**: Update the ASCII diagram
4. **Date**: Update the `Last updated` comment at the top of this file

Progress bars use: `█` (filled) and `░` (empty), 10 characters wide.
Percentages: 0%, 10%, 20%, ... 100% (in 10% increments).
