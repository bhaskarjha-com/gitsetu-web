#!/usr/bin/env bash
# sync_docs.sh
# Downloads documentation from the core GitSetu repository and prepends Astro frontmatter

set -euo pipefail

REPO_RAW_URL="https://raw.githubusercontent.com/bhaskarjha-com/gitsetu/main"
DOCS_DIR="src/pages/docs"

echo "Syncing documentation from GitSetu core repository..."

# Create docs directory
mkdir -p "$DOCS_DIR"

# Function to download and format a markdown file
fetch_doc() {
  local remote_path=$1
  local local_name=$2
  local title=$3

  echo "Fetching $local_name..."
  
  # Fetch raw markdown
  local temp_file=$(mktemp)
  curl -sL -f "$REPO_RAW_URL/$remote_path" -o "$temp_file" || {
    echo "Warning: Could not fetch $remote_path"
    return
  }

  # Prepend Astro frontmatter
  cat <<EOF > "$DOCS_DIR/$local_name"
---
layout: ../../layouts/DocsLayout.astro
title: "$title"
---
EOF
  
  # Append content, but fix relative links to other docs
  # e.g., docs/ARCHITECTURE.md -> /docs/architecture
  sed -E 's|docs/([A-Za-z0-9_-]+)\.md|/docs/\L\1|g' "$temp_file" | \
  sed -E 's|([A-Za-z0-9_-]+)\.md|/docs/\L\1|g' >> "$DOCS_DIR/$local_name"

  rm -f "$temp_file"
}

# Fetch primary docs
fetch_doc "README.md" "index.md" "Introduction"
fetch_doc "docs/ARCHITECTURE.md" "architecture.md" "Architecture"
fetch_doc "docs/TROUBLESHOOTING.md" "troubleshooting.md" "Troubleshooting"
fetch_doc "docs/MANIFESTO.md" "manifesto.md" "Manifesto"
fetch_doc "docs/product_roadmap.md" "roadmap.md" "Product Roadmap"
fetch_doc "CONTRIBUTING.md" "contributing.md" "Contributing"

echo "Documentation sync complete!"
