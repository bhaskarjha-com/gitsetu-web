#!/usr/bin/env bash
# sync_docs.sh
# Syncs documentation from the core GitSetu repository to Astro pages.

set -euo pipefail

REPO_RAW_URL="https://raw.githubusercontent.com/bhaskarjha-com/gitsetu/main"
LOCAL_REPO_DIR=".."
DOCS_DIR="src/pages/docs"

echo "Syncing documentation..."

# Clear old docs entirely to prevent ghost files
rm -rf "$DOCS_DIR"
mkdir -p "$DOCS_DIR"

# Function to copy/download and format a markdown file
sync_doc() {
  local source_path=$1
  local dest_path=$2
  local title=$3

  echo "Syncing $dest_path..."
  
  local temp_file=$(mktemp)
  
  # Try local first (for monorepo/local dev), fallback to curl
  if [ -f "$LOCAL_REPO_DIR/$source_path" ]; then
    cp "$LOCAL_REPO_DIR/$source_path" "$temp_file"
  else
    # Check if a GitHub PAT is provided in Cloudflare env vars
    if [ -n "${GITHUB_TOKEN:-}" ]; then
      curl -sL -f -H "Authorization: token $GITHUB_TOKEN" "$REPO_RAW_URL/$source_path" -o "$temp_file" || {
        echo "Warning: Could not fetch $source_path (Private Auth Failed)"
        rm -f "$temp_file"
        return
      }
    else
      curl -sL -f "$REPO_RAW_URL/$source_path" -o "$temp_file" || {
        echo "Warning: Could not fetch $source_path (Public Auth Failed)"
        rm -f "$temp_file"
        return
      }
    fi
  fi

  # Create subdirectories if needed
  mkdir -p "$(dirname "$DOCS_DIR/$dest_path")"

  # Calculate relative path to layout based on depth
  # If dest_path is "getting-started/quickstart.md", depth is 1
  # So layout path should be "../../../layouts/DocsLayout.astro"
  local depth=$(echo "$dest_path" | grep -o "/" | wc -l)
  local layout_path="../../layouts/DocsLayout.astro"
  for ((i=0; i<depth; i++)); do
    layout_path="../$layout_path"
  done

  # Prepend Astro frontmatter
  cat <<EOF > "$DOCS_DIR/$dest_path"
---
layout: $layout_path
title: "$title"
---
EOF
  
  # Strip .md extensions from internal links for clean URLs, preserving #anchors
  sed -E 's|\]\(([^)]+)\.md(#.*)?\)|\1\2|g' "$temp_file" >> "$DOCS_DIR/$dest_path"

  rm -f "$temp_file"
}

# 1. Platform Overview
sync_doc "docs/overview/introduction.md" "index.md" "Introduction"
sync_doc "docs/overview/architecture.md" "overview/architecture.md" "Architecture"
sync_doc "docs/overview/comparisons.md" "overview/comparisons.md" "Ecosystem Comparisons"
sync_doc "docs/overview/manifesto.md" "overview/manifesto.md" "Design Manifesto"

# 2. Getting Started
sync_doc "docs/getting-started/installation.md" "getting-started/installation.md" "Installation"
sync_doc "docs/getting-started/quickstart.md" "getting-started/quickstart.md" "Quickstart"

# 3. Core Engines
sync_doc "docs/core-engines/identity-routing.md" "core-engines/identity-routing.md" "Identity Routing"
sync_doc "docs/core-engines/ssh-orchestrator.md" "core-engines/ssh-orchestrator.md" "SSH Orchestrator"
sync_doc "docs/core-engines/credential-broker.md" "core-engines/credential-broker.md" "Credential Broker"
sync_doc "docs/core-engines/precommit-guard.md" "core-engines/precommit-guard.md" "Pre-Commit Guard"

# 4. Guides
sync_doc "docs/guides/shell-prompt.md" "guides/shell-prompt.md" "Shell Prompt Integration"
sync_doc "docs/guides/hardware-keys.md" "guides/hardware-keys.md" "Hardware Keys (FIDO2)"
sync_doc "docs/guides/wsl-integration.md" "guides/wsl-integration.md" "WSL Integration"
sync_doc "docs/guides/vault-backups.md" "guides/vault-backups.md" "Vault Backups"

# 5. Enterprise & Vision
sync_doc "docs/enterprise/security-privacy.md" "enterprise/security-privacy.md" "Security & Privacy"
sync_doc "docs/enterprise/product-roadmap.md" "enterprise/product-roadmap.md" "Product Roadmap"

# 6. Reference & Support
sync_doc "docs/reference/cli-commands.md" "reference/cli-commands.md" "CLI Commands"
sync_doc "docs/reference/troubleshooting.md" "reference/troubleshooting.md" "Troubleshooting"
sync_doc "docs/reference/faq.md" "reference/faq.md" "FAQ"
sync_doc "CONTRIBUTING.md" "reference/contributing.md" "Contributing Guide"

echo "Documentation sync complete!"
