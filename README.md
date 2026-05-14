# GitSetu — Official Website & Documentation Engine

This repository contains the pristine source code for [gitsetu.bhaskarjha.dev](https://gitsetu.bhaskarjha.dev), the premium marketing site and documentation search engine for the **GitSetu CLI** tool.

## 🌟 Architectural Philosophy

Mirroring the elite, zero-dependency philosophy of the core GitSetu CLI orchestrator, this web application is engineered for absolute maximum performance, lightning-fast SEO delivery, and zero client-side framework bloat.

### The Stack
- **Framework:** [Astro v6+](https://astro.build/) (Static Site Generation for sub-second delivery).
- **Styling Engine:** Custom, zero-runtime Vanilla CSS utilizing semantic design variables and high-fidelity glassmorphism effects.
- **Client-Side Scripting:** Pure Vanilla JS. Zero third-party dependencies. No React, Vue, Tailwind, or external search libraries.

---

## 🔍 The Zero-Dependency Search Engine

Unlike traditional static documentation sites that rely on heavy third-party external scripts like Algolia, Fuse.js, or Pagefind, `gitsetu-web` implements a completely native, high-performance search pipeline from scratch:

1. **Build-Time Extraction (`src/pages/search.json.ts`):** During the build phase, Astro's server engine crawls all Markdown files, extracts metadata, frontmatter, and compiles the raw text content (`.rawContent()`) into a strongly cached JSON search index.
2. **Multi-Group Prioritization (`CommandPalette.astro`):** Client-side vanilla JS asynchronously fetches the index and filters queries in real-time. Results are grouped into distinct context tiers:
   - **Documentation:** Primary matches against file titles, descriptions, and URL structures.
   - **Commands:** Dynamically indexed actions extracted from static quick-links (e.g., install commands).
   - **Text Mentions:** Deep matches found inside the raw markdown bodies.
3. **Keyboard Navigation:** Complete accessibility integration. Global keydown listeners support seamless `↑` / `↓` indexing and `Enter` execution while safely locking focus in the input area.

---

## 📚 Documentation Synchronization Engine

> [!IMPORTANT]
> **Do not manually author or edit Markdown documentation files directly inside `src/pages/docs/`.**

To maintain a **Single Source of Truth (SSOT)**, all core documentation lives directly inside the home GitSetu CLI repository (`/docs/`). 

Before every local development run or production build, the automated sync script (`scripts/sync_docs.sh`) safely purges the local target folders and dynamically imports, formats, and formats the latest pristine Markdown files.

---

## 🚀 Local Development Guide

Ensure you have Node.js (v18+) installed.

```bash
# 1. Install pristine dependencies
npm install

# 2. Start the local dev server (automatically triggers doc sync)
npm run dev

# 3. Build optimized production assets
npm run build

# 4. Preview the local production build
npm run preview
```

---

## 📁 Repository Map

```text
├── scripts/
│   └── sync_docs.sh        # Core documentation synchronization engine
├── src/
│   ├── components/         # High-fidelity Astro components (BentoGrid, Hero, CommandPalette)
│   ├── layouts/            # Base document wrappers & SEO header schemas
│   ├── pages/              # Primary routing (index.astro, search.json.ts)
│   └── styles/             # Global design tokens & CSS system
├── astro.config.mjs        # Native Astro configuration
└── package.json            # Project configurations
```

---

## 📄 License

Released under the [MIT License](LICENSE) © Bhaskar Jha. Built with zero-defect quality standards.
