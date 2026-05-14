# GitSetu — Official Website & Documentation Engine

This repository contains the pristine source code for [gitsetu.bhaskarjha.dev](https://gitsetu.bhaskarjha.dev), the premium marketing site and documentation search engine for the **GitSetu CLI** tool.

## 🌟 Architectural Philosophy

The GitSetu web platform is engineered as a **Frontier Developer Portal**. It moves beyond traditional static generation to deliver a fluid, application-like experience with military-grade integrations for AI agents, offline search, and interactive browser emulation.

### The Stack
- **Framework:** [Astro v6+](https://astro.build/) (Static Site Generation for sub-second delivery).
- **Styling Engine:** Custom, zero-runtime Vanilla CSS utilizing semantic design variables and high-fidelity glassmorphism effects.
- **Routing Engine:** Astro View Transitions (`ClientRouter`) for SPA-like instant navigation with zero React/Vue overhead.
- **Terminal Emulation:** [@xterm/xterm](https://xtermjs.org/) for a fully interactive, browser-native sandbox.
- **Search Engine:** [@orama/orama](https://oramasearch.com/) for offline, typo-tolerant vector search at the Edge.

---

## 🤖 Agentic SEO & Machine Readability

We design for both humans and autonomous agents (GitHub Copilot, Cursor, ChatGPT).

1. **`llms.txt` Pipeline:** We generate a highly concentrated, minified markdown file (`/llms.txt`) that agents can parse instantly to understand GitSetu's complete documentation without navigating complex HTML DOMs.
2. **JSON-LD Semantic Web:** The site actively injects `SoftwareApplication` and `TechArticle` schemas. This explicitly defines our OS requirements (POSIX) and dependencies (Bash 3.2) directly to Google Rich Snippets for maximum organic discovery.

---

## 🔍 Offline-First Orama Search

Our `⌘K` Command Palette abandons slow API requests and naive regex matching in favor of an **Offline-First Vector Search Engine**:

1. **Build-Time Extraction:** Astro compiles all markdown into a raw `search.json` API endpoint.
2. **Client-Side Indexing:** When a user opens the Command Palette, `@orama/orama` downloads the JSON and compiles a highly compressed binary `.trie` dictionary directly into browser memory.
3. **Typo Tolerance:** Searches happen in sub-milliseconds with a built-in typo tolerance of 1 (e.g., searching "hardwre key" perfectly matches "Hardware Keys") without ever hitting a backend server.

---

## 💻 The Interactive Xterm Sandbox

The hero section features a "Flawless Illusion" terminal demo to eliminate adoption friction.
Instead of a static CSS animation or a massive WebAssembly download, we use **Xterm.js** coupled with a custom TypeScript State Machine. 

Users can natively click the terminal, type `gitsetu setup`, and proceed through a perfect, keystroke-for-keystroke simulation of the cryptographic SSH-key generation process.

---

## 📚 Documentation Synchronization Engine

> [!IMPORTANT]
> **Do not manually author or edit Markdown documentation files directly inside `src/pages/docs/`.**

To maintain a **Single Source of Truth (SSOT)**, all core documentation lives directly inside the home GitSetu CLI repository (`/docs/`). 

Before every local development run or production build, the automated sync script (`scripts/sync_docs.sh`) safely purges the local target folders and dynamically imports and formats the latest pristine Markdown files.

---

## 🚀 Local Development Guide

Ensure you have Node.js (v18+) installed.

```bash
# 1. Install dependencies (Astro, Orama, Xterm)
npm install

# 2. Start the local dev server (automatically triggers doc sync)
npm run dev

# 3. Build optimized production assets
npm run build
```

---

## 📁 Repository Map

```text
├── scripts/
│   ├── sync_docs.sh        # Core documentation synchronization engine
│   └── generate_llms.js    # Agentic SEO pipeline generator
├── src/
│   ├── components/         # High-fidelity components (TerminalDemo, CommandPalette)
│   ├── layouts/            # Base document wrappers & JSON-LD SEO schemas
│   ├── pages/              # Primary routing (index.astro, search.json.ts)
│   └── styles/             # Global design tokens & CSS system
├── public/                 # Static assets (og-image.png, llms.txt)
├── astro.config.mjs        # Native Astro configuration
└── package.json            # Project dependencies
```

---

## 📄 License

Released under the [MIT License](LICENSE) © Bhaskar Jha. Built with zero-defect quality standards.
