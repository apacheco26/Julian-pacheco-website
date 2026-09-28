#!/usr/bin/env bash
# Sync the site to the home server. Pass --dry-run to preview.
set -euo pipefail
cd "$(dirname "$0")"
rsync -av --delete "$@" \
  --exclude '.git' --exclude '.gitignore' --exclude 'README.md' --exclude 'deploy.sh' \
  ./ 10.0.0.76:/home/julian/sites/julian-pacheco.com/
