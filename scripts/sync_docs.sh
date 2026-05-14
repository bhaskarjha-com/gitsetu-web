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
    curl -sL -f "$REPO_RAW_URL/$source_path" -o "$temp_file" || {
      echo "Warning: Could not fetch $source_path"
      rm -f "$temp_file"
      return
    }
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
  
  # Strip .md extensions from internal links for clean URLs
  sed -E 's|\]\(([^)]+)\.md\)|\1|g' "$temp_file" >> "$DOCS_DIR/$dest_path"

  rm -f "$temp_file"
}

# 1. Getting Started
sync_doc "docs/getting-started/introduction.md" "index.md" "Introduction"
sync_doc "docs/getting-started/installation.md" "getting-started/installation.md" "Installation"
sync_doc "docs/getting-started/quickstart.md" "getting-started/quickstart.md" "Quickstart"

# 2. Core Concepts
sync_doc "docs/core-concepts/identity-routing.md" "core-concepts/identity-routing.md" "Identity Routing"
sync_doc "docs/core-concepts/credential-broker.md" "core-concepts/credential-broker.md" "Credential Broker"
sync_doc "docs/core-concepts/precommit-guard.md" "core-concepts/precommit-guard.md" "Pre-Commit Guard"

# 3. Guides
sync_doc "docs/guides/hardware-keys-fido2.md" "guides/hardware-keys-fido2.md" "Hardware Keys (FIDO2)"
sync_doc "docs/guides/backup-and-restore.md" "guides/backup-and-restore.md" "Backup & Restore"
sync_doc "docs/guides/wsl-integration.md" "guides/wsl-integration.md" "WSL Integration"

# 4. Reference
sync_doc "docs/reference/cli-commands.md" "reference/cli-commands.md" "CLI Command Reference"

# 5. Enterprise
sync_doc "docs/enterprise/security-privacy.md" "enterprise/security-privacy.md" "Security & Privacy"

# 6. Project
sync_doc "docs/project/architecture.md" "project/architecture.md" "Architecture"
sync_doc "docs/project/troubleshooting.md" "project/troubleshooting.md" "Troubleshooting"
sync_doc "docs/project/faq.md" "project/faq.md" "FAQ"
sync_doc "docs/project/manifesto.md" "project/manifesto.md" "Manifesto"
sync_doc "docs/project/roadmap.md" "project/roadmap.md" "Product Roadmap"
sync_doc "CONTRIBUTING.md" "project/contributing.md" "Contributing"

echo "Documentation sync complete!"
