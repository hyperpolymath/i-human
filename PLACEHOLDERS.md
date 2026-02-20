# Template Placeholders

All placeholders in this template follow the `{{PLACEHOLDER}}` pattern.
After cloning, replace them with your project-specific values.

## Recommended: Interactive Bootstrap

```bash
just init
```

This interactively prompts for all values, replaces every placeholder,
validates the result, and runs k9-svc checks if available.

## Manual Replace

```bash
# If you prefer manual replacement (run from repo root)

sed -i 's/Jonathan D.A. Jewell/Jane Doe/g' $(grep -rl 'Jonathan D.A. Jewell' .)
sed -i 's/jonathan.jewell@open.ac.uk/jane@example.org/g' $(grep -rl 'jonathan.jewell@open.ac.uk' .)
sed -i 's/hyperpolymath/my-org/g' $(grep -rl 'hyperpolymath' .)
sed -i 's/I, Human/my-project/g' $(grep -rl 'I, Human' .)
sed -i 's/I_HUMAN/MY_PROJECT/g' $(grep -rl 'I_HUMAN' .)
sed -i 's/i_human/my_project/g' $(grep -rl 'i_human' .)
sed -i 's/i-human/my-project/g' $(grep -rl 'i-human' .)
sed -i 's/github.com/github.com/g' $(grep -rl 'github.com' .)
sed -i "s/2026/$(date +%Y)/g" $(grep -rl '2026' .)
sed -i "s/2026-02-20/$(date +%Y-%m-%d)/g" $(grep -rl '2026-02-20' .)
```

## Placeholder Reference

### Author & Copyright

| Placeholder | Description | Example | Files |
|---|---|---|---|
| `Jonathan D.A. Jewell` | Full legal name | `Jane Doe` | SPDX headers (all files), MAINTAINERS.md, .mailmap, .reuse/dep5, docs/AI-CONVENTIONS.md |
| `jonathan.jewell@open.ac.uk` | Primary contact email | `jane@example.org` | SPDX headers (all files), .mailmap, .reuse/dep5, .well-known/humans.txt |
| `jonathan.jewell@gmail.com` | Previous/secondary email (for .mailmap) | `old@example.com` | .mailmap |
| `The Open University` | Author's organization/affiliation | `Acme University` | project-metadata.k9.ncl |
| `Jewell` | Author surname (for citations) | `Doe` | docs/CITATIONS.adoc |
| `Jonathan` | Author first name (for citations) | `Jane` | docs/CITATIONS.adoc |
| `J.D.A.` | Author initials (for citations) | `J.` | docs/CITATIONS.adoc |

### Project Identity

| Placeholder | Description | Example | Files |
|---|---|---|---|
| `I, Human` | Human-readable project name | `My Project` | SECURITY.md, CODE_OF_CONDUCT.md, TOPOLOGY.md, STATE.a2ml, Justfile, GOVERNANCE.md, MAINTAINERS.md, flake.nix, devcontainer.json |
| `Digital trust and CAPTCHA risk audit tool` | One-line description | `A tool for X` | flake.nix |
| `I_HUMAN` | Uppercase identifier (for Idris2 modules, C macros) | `MY_PROJECT` | ABI-FFI-README.md, src/abi/*.idr, ffi/zig/*.zig |
| `i_human` | Lowercase identifier (for C symbols, filenames) | `my_project` | ABI-FFI-README.md, ffi/zig/*.zig |
| `i-human` | Repository name (slug) | `my-project` | CONTRIBUTING.md, SECURITY.md, CODE_OF_CONDUCT.md, cliff.toml |
| `hyperpolymath` | GitHub/GitLab org or username | `my-org` | SPDX headers, CONTRIBUTING.md, SECURITY.md, GOVERNANCE.md, MAINTAINERS.md, CODEOWNERS, mirror.yml, cliff.toml |
| `github.com` | Git forge domain | `github.com` | CONTRIBUTING.md |

### Dates

| Placeholder | Description | Example | Files |
|---|---|---|---|
| `2026` | Current year | `2026` | SPDX headers (all files), GOVERNANCE.md, MAINTAINERS.md |
| `2026-02-20` | Current date (ISO) | `2026-02-14` | STATE.a2ml, MAINTAINERS.md |
| `2026-02-20` | Last updated date | `2026-02-14` | TOPOLOGY.md, THREAT-MODEL.md |

### Contact & Security

| Placeholder | Description | Example | Files |
|---|---|---|---|
| `jonathan.jewell@open.ac.uk` | Security contact email | `security@example.org` | SECURITY.md |
| `{{PGP_FINGERPRINT}}` | 40-char PGP fingerprint | `ABCD 1234 ...` | SECURITY.md |
| `{{PGP_KEY_URL}}` | URL to public PGP key | `https://keys.openpgp.org/...` | SECURITY.md |
| `https://github.com/hyperpolymath/i-human` | Project website | `https://example.org` | SECURITY.md |
| `jonathan.jewell@open.ac.uk` | Conduct reports email | `conduct@example.org` | CODE_OF_CONDUCT.md |
| `Code of Conduct Committee` | Conduct committee name | `Code of Conduct Committee` | CODE_OF_CONDUCT.md |
| `48 hours` | SLA for initial response | `48 hours` | CODE_OF_CONDUCT.md |

### Git

| Placeholder | Description | Example | Files |
|---|---|---|---|
| `main` | Main branch name | `main` | CONTRIBUTING.md |

### Build

| Placeholder | Description | Example | Files |
|---|---|---|---|
| `PMPL-1.0-or-later` | License name | `PMPL-1.0-or-later` | ABI-FFI-README.md |
| `Digital trust and CAPTCHA risk audit tool` | One-line project description | `FFI bridges between languages` | STATE.a2ml |

### AI Manifest

| Placeholder | Description | Example | Files |
|---|---|---|---|
| `i-human` | Repository name | `my-project` | 0-AI-MANIFEST.a2ml |
| `2026-02-20` | Creation date | `2026-02-14` | 0-AI-MANIFEST.a2ml |
| `hyperpolymath` | Maintainer name | `hyperpolymath` | 0-AI-MANIFEST.a2ml |

### AI Installation Guide

| Marker | Description | Files |
|---|---|---|
| `[TODO-AI-INSTALL]` | Unfilled section in AI installation guide | `docs/AI_INSTALLATION_GUIDE.adoc`, `docs/AI-INSTALL-README-SECTION.adoc`, `README.adoc` |

These are **not** standard `{{PLACEHOLDER}}` markers -- they are TODO markers
that must be replaced with project-specific content before release. They mark
sections where the developer (or AI) must fill in:

- What questions the AI should ask the user
- Exact prerequisite check and install commands
- Privacy notice specific to this project
- Complete installation command block
- Credential setup instructions (URLs, scopes, env vars)
- Verification commands and expected output
- Error handling table
- Example conversation

**finishbot checks:** `just validate-ai-install` verifies no `[TODO-AI-INSTALL]` markers remain.

## Deletion Markers

Some files contain deletion instructions:

| Marker | Meaning | File |
|---|---|---|
| `{{~ ... ~}}` | Delete this entire line after reading | ABI-FFI-README.md (line 1) |

## Verification

After replacing all placeholders, verify none remain:

```bash
grep -rn '{{' . --include='*.md' --include='*.adoc' --include='*.a2ml' \
  --include='*.scm' --include='*.idr' --include='*.zig' --include='*.res' \
  --include='Justfile' --include='*.nix' --include='*.toml' --include='*.yml' \
  --include='*.yaml' --include='*.hs' --include='*.ncl' --include='*.txt' \
  --include='*.json' --include='Containerfile' --include='dep5' \
  | grep -v 'PLACEHOLDERS.md' | grep -v 'node_modules'
```

If the above command produces no output, all placeholders have been replaced.
