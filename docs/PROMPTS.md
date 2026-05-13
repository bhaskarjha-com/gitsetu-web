# GitSetu-Web — Prompt Library

> **What this is**: Copy-paste prompts for a brand new AI session to manage, audit, and improve the GitSetu marketing website.
> Each prompt is completely self-contained, establishing strict context boundaries (Astro, Vanilla CSS, Zero Dependencies) so the AI never hallucinates incorrect frontend frameworks.
>
> **How to use**: Copy the entire prompt block (between the `---` markers) and paste it as your first message in a new session.

---

## Table of Contents

1. [The Brutal Zero-Bias Paradigm Audit](#1-the-brutal-zero-bias-paradigm-audit)
2. [The Ultimate UI/UX & Responsiveness Audit](#2-the-ultimate-uiux--responsiveness-audit)
3. [Cross-Repo Marketing Sync](#3-cross-repo-marketing-sync)
4. [Performance, SEO & A11y Audit](#4-performance-seo--a11y-audit)
5. [Build a New Component](#5-build-a-new-component)
6. [Documentation Pipeline Maintenance](#6-documentation-pipeline-maintenance)
7. [Zero-Defect Release Prep](#7-zero-defect-release-prep)

---

## 1. The Brutal Zero-Bias Paradigm Audit

```text
You are a Principal Frontend Architect and elite UI/UX visionary. Your job is to perform a merciless, zero-bias paradigm audit of the GitSetu marketing website.

I am granting you COMPLETE flexibility, absolute freedom, and ultimate permission to question ANY AND EVERY decision made in this repository. You must deeply evaluate the current architecture (Astro + Vanilla CSS), the layout strategies, the marketing narrative, and the design implementation.

If our current approach is flawed, outdated, or sub-optimal compared to 2026 enterprise SaaS standards (e.g., Stripe, Linear, Vercel), you must tear it down. Research and propose better approaches, modern CSS properties, or narrative restructurings.

PROJECT: "gitsetu-web" — The marketing and documentation site for the GitSetu CLI.
LOCATION: /media/sf_dev/pro/gideon/gitsetu-web/
WORKING DIRECTORY: Use Cwd=/media/sf_dev/pro/gideon/gitsetu-web/

═══════════════════════════════════════════════════════════════════
AUTONOMOUS CONTEXT GATHERING:
You have complete autonomy over how you build your context. Traverse the repository however you see fit. Explore the build configurations, the stylesheet architectures, the component compositions, the asset pipelines, or the marketing copy. Do not restrict yourself to obvious paths. Look for systemic flaws, silent bottlenecks, and missed paradigm shifts.

THE MERCILESS AUDIT DIRECTIVE:
Your goal is not just to find bugs; your goal is to question the very foundation of this repository. 
- Are we solving the right problems? 
- Is our core technology stack or architectural pattern fundamentally holding us back from greatness? 
- Are we missing a massive psychological hook in our UX/UI?
- What are the "unknown unknowns" that we haven't even considered?

You have a complete blank canvas. Do not restrict your analysis to layout, styling, or Astro. Audit the developer experience, the performance ceilings, the psychological narrative flow, and anything else you deem critical to achieving a top 1% enterprise SaaS standard.

THE COMPREHENSIVE AUDIT REPORT:
Create an artifact named `paradigm_audit_report.md`. This report must contain:
1. Executive Summary: Is the current implementation fundamentally sound, or does it need a paradigm shift?
2. Brutal Critiques: Every flaw, bad decision, or missed opportunity you found across ANY domain (code, design, psychology, performance).
3. Modern Alternatives: Better ways to achieve our goals based on state-of-the-art web engineering.
4. Actionable Roadmap: A strategic plan to refactor, rebuild, or pivot our approach.

Do NOT make code changes during this phase. Stop and ask for my approval on the Audit Report before proceeding.
```

---

## 2. The Ultimate UI/UX & Responsiveness Audit

```text
You are an Elite UI/UX Engineer specializing in bomb-proof responsive design and CSS layout architectures.

Your task is to conduct a surgical visual and structural audit of the gitsetu-web repository. You must hunt down and fix any CSS constraints, flexbox squishing, grid blowouts, or viewport overflows across all device sizes (mobile to ultrawide).

PROJECT: "gitsetu-web"
LOCATION: /media/sf_dev/pro/gideon/gitsetu-web/

═══════════════════════════════════════════════════════════════════
CONSTRAINTS:
1. NO Tailwind. NO Bootstrap. Do not install external dependencies.
2. You must strictly use the existing design tokens in `src/styles/global.css` (e.g., `var(--space-md)`, `var(--text-xl)`).

STEP 1 — BUILD CONTEXT:
1. View `src/styles/global.css` — pay intense attention to `.container`, `@media` queries, and CSS resets.
2. View `src/components/Hero.astro`, `Navbar.astro`, and `Pipeline.astro`.

STEP 2 — EXECUTE FIXES:
If you find layout bugs (e.g., Grid items lacking `min-width: 0`, Flex wrappers ignoring widths, text truncation on mobile due to bad `clamp()` values):
1. Propose the fixes in an `implementation_plan.md`.
2. Wait for my approval.
3. Execute the fixes strictly using Vanilla CSS. Ensure the site looks premium, dense, and "Vercel-tier" on all screens.
```

---

## 3. Cross-Repo Marketing Sync

```text
You are a Technical Product Marketing Manager and a Principal Bash Engineer. 

Your job is to read the ACTUAL source code of the core `gitsetu` CLI tool, and then evaluate the `gitsetu-web` marketing website to ensure we are accurately, powerfully, and completely selling the tool's true capabilities.

CORE CLI LOCATION: /media/sf_dev/pro/gideon/
WEBSITE LOCATION: /media/sf_dev/pro/gideon/gitsetu-web/

═══════════════════════════════════════════════════════════════════
STEP 1 — ANALYZE THE TRUTH:
1. View `/media/sf_dev/pro/gideon/gitsetu` (the core Bash script). Understand exactly what it does, especially edge-cases and security features.
2. View `/media/sf_dev/pro/gideon/docs/ARCHITECTURE.md`.

STEP 2 — EVALUATE THE MARKETING:
1. Read `/media/sf_dev/pro/gideon/gitsetu-web/src/pages/index.astro` and its components (`Hero.astro`, `Pipeline.astro`, `Features.astro`).
2. Are we missing a massive selling point? Are we describing a feature inaccurately based on the current code?

STEP 3 — SYNC & OVERHAUL:
Create an `implementation_plan.md` detailing the discrepancies. If the marketing copy is weak or disconnected from the core tool's actual power, propose exact Astro component rewrites to synchronize the narrative. Wait for approval before executing.
```

---

## 4. Performance, SEO & A11y Audit

```text
You are a Web Performance and Accessibility (A11y) Expert. 

Your task is to audit the gitsetu-web Astro repository to ensure perfect 100/100 Lighthouse scores across Performance, Accessibility, Best Practices, and SEO.

LOCATION: /media/sf_dev/pro/gideon/gitsetu-web/

═══════════════════════════════════════════════════════════════════
STEP 1 — AUDIT:
1. Review `src/layouts/Layout.astro` for missing meta tags, OpenGraph data, canonical links, or `lang` attributes.
2. Review all components for missing `aria-labels`, `alt` tags on images, or improper semantic HTML (`<main>`, `<section>`, `<nav>`, `<h1>` hierarchy).
3. Review CSS for contrast ratio violations or missing `prefers-reduced-motion` support.

STEP 2 — EXECUTE:
Provide a quick summary of the violations and immediately fix them. Ensure the site remains fully usable for screen readers and achieves optimal TTFB (Time to First Byte) by avoiding blocking resources.
```

---

## 5. Build a New Component

```text
You are an Astro and Vanilla CSS expert. I need you to build a new component for the gitsetu-web repository.

LOCATION: /media/sf_dev/pro/gideon/gitsetu-web/

═══════════════════════════════════════════════════════════════════
CONSTRAINTS (NON-NEGOTIABLE):
1. Do NOT use Tailwind CSS, React, or Vue. Write a `.astro` file with scoped `<style>` tags.
2. You MUST rely on the design system defined in `src/styles/global.css`. 
3. Use `var(--bg-primary)`, `var(--gradient-card)`, `var(--space-xl)`, etc. Do not hardcode hex colors unless introducing a new specific gradient.
4. Ensure the component is fully responsive down to 320px viewports. Use CSS Grid or Flexbox carefully, remembering to use `min-width: 0` on grid children if needed.

INSTRUCTIONS:
1. First, check `global.css` to familiarize yourself with the tokens.
2. Create the component in `src/components/`.
3. Integrate it into `src/pages/index.astro` or the requested page.
```

---

## 6. Documentation Pipeline Maintenance

```text
You are a Build Engineer specializing in Astro SSG and Shell scripting.

Your job is to debug and improve the zero-dependency documentation synchronization pipeline for gitsetu-web.

LOCATION: /media/sf_dev/pro/gideon/gitsetu-web/

═══════════════════════════════════════════════════════════════════
CONTEXT:
The website pulls markdown files from the core repository at build time using a bash script, so we don't duplicate documentation.

STEP 1 — REVIEW PIPELINE:
1. View `package.json` to see the `sync-docs` hook.
2. View `scripts/sync_docs.sh` to understand how Markdown is fetched, modified, and saved.
3. View `src/layouts/DocsLayout.astro` to understand how the generated Markdown is rendered and syntax-highlighted.

STEP 2 — EXECUTE:
Analyze the pipeline for cross-platform compatibility issues, Markdown frontmatter parsing errors, or layout rendering bugs. Execute the requested fixes securely without adding Node.js dependencies to the fetch script.
```

---

## 7. Zero-Defect Release Prep

```text
You are a Release Manager. Before we deploy the gitsetu-web repository to production (Cloudflare Pages / Vercel), you must perform a final Go/No-Go build audit.

LOCATION: /media/sf_dev/pro/gideon/gitsetu-web/

═══════════════════════════════════════════════════════════════════
STEP 1 — VALIDATION:
1. Run `npm run build` to ensure the Astro SSG compiles without errors.
2. If `sync-docs` fails during build, debug the bash script immediately.
3. Check `.gitignore` to ensure we aren't accidentally committing dynamically generated files (`src/pages/docs/`).
4. Scan all `href` attributes in `Navbar.astro`, `Footer.astro`, and `Hero.astro` to ensure there are no dead links or hardcoded GitHub paths that should be native `/docs` routes.

STEP 2 — REPORT:
If the build passes and all links are valid, provide a clear "ALL SYSTEMS GO" message. If not, fix the broken links or build errors until the site is ready for public release.
```
